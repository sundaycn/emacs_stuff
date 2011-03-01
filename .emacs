;load-path
(add-to-list 'load-path "/home/sun/.emacsLoadpath")



;============================ 语言环境字符集设置 =================================
 (set-language-environment 'Chinese-GB)
 (set-keyboard-coding-system 'utf-8)
 (set-clipboard-coding-system 'utf-8)
 (set-terminal-coding-system 'utf-8)
 (set-buffer-file-coding-system 'utf-8)
 (set-default-coding-systems 'utf-8)
 (set-selection-coding-system 'utf-8)
 (modify-coding-system-alist 'process "*" 'utf-8)
 (setq default-process-coding-system '(utf-8 . utf-8))
 (setq-default pathname-coding-system 'utf-8)
 (set-file-name-coding-system 'utf-8)
 (setq ansi-color-for-comint-mode t) ;;处理shell-mode乱码,好像没作用
;=========================== 语言环境字符集设置结束 ===============================


;================================basic-settings==================================
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t);默认显示行号的同时，也显示列号
 '(inhibit-startup-screen t);关闭启动画面
 '(show-paren-mode t);显示与当前光标所在位置的括号匹配的另一个括号
)


(display-time-mode t);显示当前时间,格式如下
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)


(set-scroll-bar-mode nil);取消滚动栏
(global-linum-mode t);显示行号
(setq visible-bell t);关闭出错时的蜂鸣提示声
(mouse-avoidance-mode'animate);当鼠标箭头与光标相近时，使鼠标箭头自动移开
;(blink-cursor-mode nil);光标不闪烁
(setq-default cursor-type 'bar);光标显示为一竖线
;;(tool-bar-mode -1);; 不显示emcas的工具栏
(menu-bar-mode -1);; 不显示emcas的菜单栏,按ctrl+鼠标右键仍能调出该菜单
(setq x-select-enable-clipboard t);; 支持emacs和外部程序之间进行粘贴
(fset 'yes-or-no-p 'y-or-n-p);以 'y/n'字样代替原默认的'yes/no'字样
(setq frame-title-format "%b@emacs");在最上方的标题栏显示当前buffer的名字
(setq make-backup-files nil);关闭自动备份功能
(setq auto-save-mode nil);关闭自动保存模式
(setq auto-save-default nil);不生成名为#filename# 的临时文件
(setq require-final-newline t);; 自动的在当前的buffer文件的最后加一个空行
(global-set-key "\r" 'align-newline-and-indent);;自动缩进<C-j>变为<Enter>
(setq echo-keystrokes 0.1);; 尽快显示按键序列提示
(global-font-lock-mode t);; 语法高亮
;; 用来显示当前光标在哪个函数
;(require 'which-func)
(which-func-mode 1)
(setq which-func-unknown "unknown")
;; 用M-x执行某个命令的时候，在输入的同时给出可选的命令名提示
(icomplete-mode 1)
(define-key minibuffer-local-completion-map (kbd "SPC") 'minibuffer-complete-word)

(global-hl-line-mode 1);;高亮当前行

(set-face-background 'default "black");背景设定
(set-face-foreground 'default "white" );前景设定
;颜色参考value：X界面菜单栏中[edit]->[text properties]->[Display colors]


;;用shift＋上下左右箭头切换buffer
(windmove-default-keybindings)
(setq windmove-wrap-around t)


;自定义按键
(global-set-key [f1] 'shell);F1进入Shell
;(global-set-key [f5] 'gdb);F5调试程序
(setq compile-command "make -f Makefile")
(global-set-key [f7] 'do-compile);F7编译文件
(global-set-key [f8] 'other-window);F8窗口间跳转
(global-set-key [C-return] 'kill-this-buffer);C-return关闭当前buffer
(global-set-key [f10] 'split-window-vertically);F10分割窗口
(global-set-key [f11] 'delete-other-windows);F11 关闭其它窗口
(global-set-key [f12] 'my-fullscreen);F12 全屏
(global-set-key (kbd "C-,") 'backward-page);文件首
(global-set-key (kbd "C-.") 'forward-page);文件尾

;================================================================================


;================================session=========================================
;;记录所有操作
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;;记录和恢复屏幕
(load "desktop")
(desktop-load-default)
;(desktop-read)
;;desktop自动存盘模式,23需要加
(desktop-save-mode 1)

;================================================================================


;=================================cc-mode========================================
;(add-to-list 'load-path "/home/sun/.emacsLoadpath/cc-mode-5.31.3")
;(require 'cc-mode)
;(c-set-offset 'inline-open 0)
;(c-set-offset 'friend '-)
;(c-set-offset 'substatement-open 0)
;(setq tab-width 4)
;http://cc-mode	.	sourceforge.net/
;http://www	.	kklinux.com/html/linuxwangluojishu/linuxxitongguanliyuan/200902/28-3728.html

;;缩进
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list ())
(loop for x downfrom 40 to 1 do
     (setq tab-stop-list (cons (* x 4) tab-stop-list)))

(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                  empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 4)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t)
    )
  "My C Programming Style")

;; offset customizations not in my-c-style
(setq c-offsets-alist '((member-init-intro . ++)))

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "PERSONAL" my-c-style t)
  ;; other customizations
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like auto-newline and hungry-delete
  (c-toggle-auto-hungry-state 1)
  ;; key bindings for all supported languages.  We can put these in
  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
  ;; java-mode-map, idl-mode-map, and pike-mode-map inherit from it.
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;================================================================================


;===================================speedbar=====================================
(require 'speedbar)
(global-set-key [(f4)] 'speedbar-get-focus);speedbar快捷键[F4]

;================================================================================


;======================================GDB=======================================
(global-set-key [(f5)] 'gdb-many-windows);gdb-many-windows快捷键[F5]
(setq gdb-use-separate-io-buffer nil);不需要"IO buffer"时，则设为nil,需要时设t

;================================================================================


;====================================gtags======================================
(autoload 'gtags-mode "gtags" "" t);;start Emacs and execute gtags-mode function.  
(setq c-mode-hook
      '(lambda ()
     (gtags-mode 1)));get into gtags-mode whenever you get into c-mode

;===============================================================================


;=================================auto-complete=================================
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacsLoadpath//ac-dict")
(ac-config-default)

;===============================================================================
;加入xcscope插件
;(require 'xcscope)
;##cedet(Collection of Emacs Development Environment Tools)
;##ecb(Emacs Code Browser)
;##doxymacs
;##compile
