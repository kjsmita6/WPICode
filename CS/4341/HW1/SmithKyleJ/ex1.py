class ConnectFour:

    def __init__(self, board, w, h):
        """Class constructor"""
        # Board data
        self.board = board
        # Board width
        self.w = w
        # Board height
        self.h = h
    def isLineAt(self, x, y, dx, dy):
        """Return True if a line of identical tokens exists starting at (x,y)
           in direction (dx,dy)"""
        # Your code here
        val = self.board[x][y]
        for i in range(3):
            next_x = x + dx
            next_y = y + dy
            # x is up/down, y is left/right. rows/cols
            if next_x >= 0 and next_x < self.h and next_y >= 0 and next_y < self.w:
                next_val = self.board[next_x][next_y]
                if val != next_val:
                    return False
                x = next_x
                y = next_y
            else:
                return False
        return True

    def isAnyLineAt(self, x, y):
        """Return True if a line of identical symbols exists starting at (x,y)
           in any direction"""
        return (self.isLineAt(x, y, 1, 0) or # Horizontal
                self.isLineAt(x, y, 0, 1) or # Vertical
                self.isLineAt(x, y, 1, 1) or # Diagonal up
                self.isLineAt(x, y, 1, -1)) # Diagonal down

    def getOutcome(self):
        """Returns the winner of the game: 1 for Player 1, 2 for Player 2, and
           0 for no winner"""
        # Your code here, use isAnyLineAt()
        for i in range(self.h):
            for j in range(self.w):
                val = self.board[i][j]
                if val != 0 and self.isAnyLineAt(i, j):
                    return val
        return 0

    def printOutcome(self):
        """Prints the winner of the game"""
        o = self.getOutcome()
        if o == 0:
            print("No winner")
        else:
            print("Player", o, " won")
