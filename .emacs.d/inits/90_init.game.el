;; Games

;; tetris
(setq tetris-score-file "~/.emacs.d/game-scores/tetris-scores")
(defadvice tetris-end-game (around zap-scores activate)
  (save-window-excursion ad-do-it))
