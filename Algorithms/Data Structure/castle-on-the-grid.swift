extension String {
    func indexOf(char: Character) -> Int? {
        return firstIndex(of: char)?.utf16Offset(in: self)
    }
}

typealias Matrix = [MatrixIndex]
typealias MatrixColorStatus = [ColorStatus]

struct MatrixIndex {
    let matrixNode: Node
    let visitedNode: Node
}

struct ColorStatus {
    let colorNode: Node
    var colorStatus: ColorEnum
}

struct Node: Hashable {
    var row: Int = 0
    var column: Int = 0
    
    func isSamePosition(grid: Node) -> Bool {
        return column == grid.column && row == grid.row
    }
}

struct CastleProperties {
    var blocks: [Node] = []
    var goal: Node = Node()
    var startPosition: Node = Node()
    var currentNode: Node = Node()
    var castleQueue: [Node] = []
    var matrix: Matrix = []
    var matrixColorStatus: MatrixColorStatus = []
    var gridSize: Int = 0
    
    func isCurrentColorNodeGreenOrRed(currentNode: Node) -> Bool {
        guard let currentColorNode = matrixColorStatus.first(where: { colorStatus in
            colorStatus.colorNode.isSamePosition(grid: currentNode)
        }) else { return false }
        return currentColorNode.colorStatus == .red || currentColorNode.colorStatus == .green
    }

    mutating func turnRedCurrentNode(currentNode: Node) {
        if let i = matrixColorStatus.firstIndex(where: { $0.colorNode.isSamePosition(grid: currentNode) }) {
            matrixColorStatus[i].colorStatus = .red
        } else {
            matrixColorStatus.append(ColorStatus(colorNode: currentNode, colorStatus: .red))
        }
    }
}

enum ColorEnum: String {
    case red = "current_node"
    case green = "visited"
    case white = "not_visited"
}

func minimumMoves(grid: [String], startX: Int, startY: Int, goalX: Int, goalY: Int) -> Int {
    let blocks: [Node] = getBlocks(grid: grid)
    let goal: Node = Node(row: goalX, column: goalY)
    let currentNode: Node = Node(row: startX, column: startY)
    let queue: [Node] = [currentNode]
    let matrix: Matrix = []
    let colorStatus: MatrixColorStatus = [ColorStatus(colorNode: currentNode, colorStatus: .red)]
    return moving(properties: CastleProperties(blocks: blocks,
                                              goal: goal,
                                              startPosition: currentNode,
                                              currentNode: currentNode,
                                              castleQueue: queue,
                                              matrix: matrix,
                                              matrixColorStatus: colorStatus,
                                              gridSize: grid.first?.count ?? 0))
}

func getBlocks(grid: [String]) -> [Node] {
    var blocks: [Node] = []
    for (gridRow, currentValue) in grid.enumerated() {
        guard let gridColumn = currentValue.indexOf(char: "X") else { continue }
        blocks.append(Node(row: gridRow, column: gridColumn))
    }
    return blocks
}

func moving(properties: CastleProperties) -> Int {
    var castleProperties: CastleProperties = runningCurrentPossibilityMoves(properties: properties)
    if castleProperties.goal.isSamePosition(grid: properties.currentNode) ||
        castleProperties.castleQueue.count == 1 {
        return getMinimumMovementsCount(properties: castleProperties, currentVisitedNode: castleProperties.goal)
    }
    castleProperties.castleQueue.remove(at: 0)
    guard let newCurrentNode = castleProperties.castleQueue.first else { return getMinimumMovementsCount(properties: castleProperties, currentVisitedNode: castleProperties.goal) }
    castleProperties.currentNode = newCurrentNode
    castleProperties.turnRedCurrentNode(currentNode: properties.currentNode)
    return moving(properties: castleProperties)
}

func runningCurrentPossibilityMoves(properties: CastleProperties) -> CastleProperties {
    var castleProperties: CastleProperties = properties
    var greenColumns: [Node] = []
    var greenRows: [Node] = []

    for currentColumn in 0...properties.gridSize - 1 {
        let nodeCurrentPosition = Node(row: castleProperties.currentNode.row, column: currentColumn)
        guard notContainsBlock(blocks: castleProperties.blocks, curentNode: nodeCurrentPosition) else { break }
        if castleProperties.isCurrentColorNodeGreenOrRed(currentNode: nodeCurrentPosition) { continue }
        castleProperties.castleQueue.append(nodeCurrentPosition)
        castleProperties.matrixColorStatus.append(ColorStatus(colorNode: nodeCurrentPosition, colorStatus: .green))
        greenColumns.append(nodeCurrentPosition)
    }

    for currentRow in 0...properties.gridSize - 1 {
        let nodeCurrentPosition = Node(row: currentRow, column: properties.currentNode.column)
        guard notContainsBlock(blocks: castleProperties.blocks, curentNode: nodeCurrentPosition) else { break }
        if castleProperties.isCurrentColorNodeGreenOrRed(currentNode: nodeCurrentPosition) { continue }
        castleProperties.castleQueue.append(nodeCurrentPosition)
        castleProperties.matrixColorStatus.append(ColorStatus(colorNode: nodeCurrentPosition, colorStatus: .green))
        greenRows.append(nodeCurrentPosition)
    }

    greenRows.forEach { currentNode in
        if castleProperties.matrix.contains(where: { matrixIndex in matrixIndex.visitedNode.isSamePosition(grid: currentNode) }) { return }
        castleProperties.matrix.append(MatrixIndex(matrixNode: castleProperties.currentNode, visitedNode: currentNode))
    }

    greenColumns.forEach { currentNode in
        if castleProperties.matrix.contains(where: { matrixIndex in matrixIndex.visitedNode.isSamePosition(grid: currentNode) }) { return }
        castleProperties.matrix.append(MatrixIndex(matrixNode: castleProperties.currentNode, visitedNode: currentNode))
    }
    return castleProperties
}

func getMinimumMovementsCount(properties: CastleProperties, stack: [Node] = [], currentVisitedNode: Node) -> Int {
    var stack: [Node] = stack
    var currentVisitedNode = currentVisitedNode

    for matrixI in properties.matrix {
        guard matrixI.visitedNode.isSamePosition(grid: currentVisitedNode) else { continue }
        stack.append(matrixI.matrixNode)
        currentVisitedNode = matrixI.matrixNode
        break
    }

    if currentVisitedNode.isSamePosition(grid: properties.startPosition) {
        return stack.count
    } else {
        return getMinimumMovementsCount(properties: properties, stack: stack, currentVisitedNode: currentVisitedNode)
    }
}

func notContainsBlock(blocks: [Node], curentNode: Node) -> Bool {
    return !blocks.contains(where: { currentGrid in
        currentGrid.isSamePosition(grid: curentNode)
    })
}

//expected 3
//print("result: \(minimumMoves(grid: [".X.",".X.", "..."], startX: 0, startY: 0, goalX: 0, goalY: 2))")

//expected 3
print("result: \(minimumMoves(grid: ["....","...X", "X...", "...."], startX: 0, startY: 0, goalX: 3, goalY: 3))")