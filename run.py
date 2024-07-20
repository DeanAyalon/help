
import chess
import chess.engine
import tkinter as tk
from tkinter import messagebox
from PIL import Image, ImageTk

# .env
import os
from dotenv import load_dotenv
load_dotenv()

class ChessGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Chess Game")
        self.board = chess.Board()
        stockfish = self.get_stockfish()
        self.engine = chess.engine.SimpleEngine.popen_uci(stockfish)
        self.selected_square = None
        self.create_widgets()
        self.update_board()

    def get_stockfish(self):
        path = os.getenv('STOCKFISH_PATH')
        # Check if the path is empty
        if not path.strip(): raise ValueError("Stockfish path is empty.")
        # Check if the file exists
        if not os.path.isfile(path): raise FileNotFoundError(f"Stockfish executable does not exist at {path}")
        print('stockfish: ' + path)
        return path

    def create_widgets(self):
        self.board_frame = tk.Frame(self.root)
        self.board_frame.pack()
        self.squares = {}
        self.images = self.load_images()
        for row in range(8):
            for col in range(8):
                color = "#F0D9B5" if (row + col) % 2 == 0 else "#B58863"
                square = tk.Label(self.board_frame, width=8, height=4, bg=color)
                square.grid(row=row, column=col)
                square.bind("<Button-1>", lambda event, r=row, c=col: self.on_click(r, c))
                self.squares[(row, col)] = square

        self.status_label = tk.Label(self.root, text="Your move")
        self.status_label.pack()

    def load_images(self):
        piece_names = [
            'black_rook', 'black_knight', 'black_bishop', 'black_queen', 'black_king',
            'black_pawn', 'white_rook', 'white_knight', 'white_bishop', 'white_queen',
            'white_king', 'white_pawn'
        ]
        piece_symbols = [
            'r', 'n', 'b', 'q', 'k', 'p', 'R', 'N', 'B', 'Q', 'K', 'P'
        ]
        images = {}
        for piece_name, piece_symbol in zip(piece_names, piece_symbols):
            img = Image.open(f"chess_pieces/{piece_name}.png")
            img = img.resize((64, 64), Image.Resampling.LANCZOS)
            images[piece_symbol] = ImageTk.PhotoImage(img)
        return images

    def update_board(self):
        for row in range(8):
            for col in range(8):
                square = chess.square(col, 7 - row)
                piece = self.board.piece_at(square)
                if piece:
                    img = self.images[piece.symbol()]
                    self.squares[(row, col)].config(image=img)
                    self.squares[(row, col)].image = img
                else:
                    self.squares[(row, col)].config(image="", text="")

    def on_click(self, row, col):
        square = chess.square(col, 7 - row)
        if self.selected_square is None:
            if self.board.piece_at(square) is not None and self.board.color_at(square) == chess.WHITE:
                self.selected_square = square
                self.squares[(row, col)].config(bg="yellow")
                self.status_label.config(text="Select destination")
            else:
                self.status_label.config(text="Select a valid piece")
        else:
            move = chess.Move(self.selected_square, square)
            if move in self.board.legal_moves:
                self.board.push(move)
                self.update_board()
                self.squares[(7 - chess.square_rank(self.selected_square), chess.square_file(self.selected_square))].config(bg=self.get_square_color(self.selected_square))
                self.selected_square = None
                if self.board.is_game_over():
                    messagebox.showinfo("Game Over", "You won!" if self.board.is_checkmate() else "Draw!")
                    self.engine.quit()
                    self.root.quit()
                else:
                    self.status_label.config(text="Bot's move")
                    self.root.after(1000, self.bot_move)
            else:
                self.squares[(7 - chess.square_rank(self.selected_square), chess.square_file(self.selected_square))].config(bg=self.get_square_color(self.selected_square))
                self.selected_square = None
                self.status_label.config(text="Invalid move, try again")

    def get_square_color(self, square):
        row = 7 - chess.square_rank(square)
        col = chess.square_file(square)
        return "#F0D9B5" if (row + col) % 2 == 0 else "#B58863"

    def bot_move(self):
        result = self.engine.play(self.board, chess.engine.Limit(time=2.0))
        self.board.push(result.move)
        self.update_board()
        if self.board.is_game_over():
            messagebox.showinfo("Game Over", "Bot won!" if self.board.is_checkmate() else "Draw!")
            self.engine.quit()
            self.root.quit()
        self.status_label.config(text="Your move")

if __name__ == "__main__":
    root = tk.Tk()
    app = ChessGUI(root)
    root.mainloop()
