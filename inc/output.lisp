;;;; @file output.lisp
;;; These functions handle the display of the game board. To print out a
;;; new board based on the current state of the game, just call "display"!
;;;
;;; Part of connect4.lisp
;;;
;;; @author Jason Pollman, Cullin Moran, Walter Alfaro, Robert Iannucci, Ricky Sanders
;;; 11/13/13

#|
	Notes:
	
	6 |_|_|_|_|_|_|_|
	5 |_|_|_|_|_|_|_|
	4 |_|_|_|_|_|_|_|
	3 |_|_|_|_|_|o|_|
	2 |_|o|x|_|x|x|_|
	1 |o|x|o|o|o|x|_|
	   1 2 3 4 5 6 7
	
	7 columns, 6 rows
	
	game variable stores a list of moves: ((col, row, player) ...)
	0 = AI, 1 = user
|#

;; Sample game based on the chart above:
;(defparameter game '((1 1 0) (2 1 1) (2 2 0) (6 1 1) (3 1 0) (6 2 1) (6 3 0) (3 2 1) (5 1 0) (5 2 1) (4 1 0)))

;; Sample row data for testing makeRow.
;; Example usage: (makeRow row1)
;(defvar fullRow '((1 0) (3 0) (6 1) (4 0) (5 0) (2 1) (7 0)))
;(defvar emptyRow '())
;(defvar row1 '((1 0) (3 0) (6 1) (4 0) (5 0) (2 1)))
;(defvar row2 '((2 0) (3 1) (6 1) (5 1)))

(defun display()
	"This function will print a representation of the global 'game' variable as pieces on a board."
	
	(let
		((rowBuilder ())
		 (allRows ()))
		
		; Build each row
		(dotimes (i 6)
			(setf rowBuilder ())
			(dolist (x game)
				(if
					; If this list describes part of the row we're building, append it to rowBuilder
					(= (cadr x) (+ i 1)) (setf rowBuilder (append rowBuilder (list (cons (car x) (cddr x)))))
				)
			)
			; Add the built row to a list of completed rows
			(setf allRows (append allRows (list rowBuilder)))
		)
		
		; Reverse allRows and print each out
		(doList (x (reverse allRows))
			(format t "~%~A" (makeRow x))
		)

		(format t "~% 1 2 3 4 5 6 7")
	)
)

;; ----------------------------- Helper Functions -----
(defun makeCell(&optional player)
	"Returns a single cell, like 'x|' or '_|' or 'o|'.
	Optional argument is the player whose piece should fill the cell (AI = 0, user = 1).
	If 'player' evaluates to anything else (or doesn't exist), the cell will be drawn with an underscore (empty).
	'x' will represent the user, and 'o' will represent the AI."
	
	(cond
		((numberp player)
			(cond
				((= player 0) (string "o|"))	; If 0, return 'o|'
				((= player 1) (string "x|"))	; If 1, return 'x|'
			)
		)
		(T (string "_|"))			; else return empty cell
	)
)

(defun makeRow(input)
	"Returns a string of cells representing a row, like: |x|_|o|o|o|x|_|
	Argument is the list of 7 or fewer entries (columns) to populate.
	Argument should take the form ((col player) (col player) ...)"
	
	;; Loop through the list and build the row
	(let
		((sorted ())
		 (result (string "|"))	; Prepend a single '|' to each row to form the leftmost vertical bar
		 (found nil))
		
		;; Sort the list by smallest to largest column numbers
		(setf sorted (sort input #'< :key #'car))
		
		(dotimes (i 7)
			(setf found nil)
			(dolist (x sorted)
				(cond
					((= (car x) (+ i 1))	; If the column at this point matches the input (to account for empty spaces)
						(setf result (concatenate 'string result (makeCell (cadr x))))		; then append the appropriate player cell
						(setf found T)														; and don't run the next part
						(return))															; break
				)
			)
			(if (not found)				; If we couldn't match a value
				(setf result (concatenate 'string result (makeCell)))						; then append an empty cell
			)
		)
		
		(string result)	; Return result
	)
)