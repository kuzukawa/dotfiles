;;;;;;;;;;;;;;;;;;;;
;; helm
;;;;;;;;;;;;;;;;;;;;
(use-package helm :straight t)
(helm-mode 1)

(setq helm-split-window-inside-p            t  ; 画面分割しても同じバッファ内にhelmのバッファを表示
      helm-move-to-line-cycle-in-source     t  ; helmバッファ内で候補の最後に到達したら上に戻る
      helm-ff-search-library-in-sexp        t  ; よく分からんがライブラリの中も検索するみたいな
      helm-echo-input-in-header-line        t)  ; helmのバッファの上部にコンソールの内容を表示

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)

(put 'narrow-to-region 'disabled nil)
