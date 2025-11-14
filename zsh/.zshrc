# ============================================================================
# ZSHRC CONFIGURATION
# ============================================================================
# "There is timing in everything. Timing in strategy cannot be mastered
#  without a great deal of practice." - Miyamoto Musashi
# ============================================================================

# ----------------------------------------------------------------------------
# PATH CONFIGURATION
# ----------------------------------------------------------------------------
# "The only reason a warrior is alive is to fight, and the only reason
#  a warrior fights is to win." - Miyamoto Musashi

# System PATH setup with Homebrew and essential directories
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"

# Java (OpenJDK 17)
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Node version management
eval "$(nodenv init -)"

# VS Code CLI
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# Console Ninja
export PATH="$HOME/.console-ninja/.bin:$PATH"

# Load Angular CLI autocompletion
if command -v ng &> /dev/null; then
  source <(ng completion script)
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kayosouza/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kayosouza/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kayosouza/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kayosouza/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Local bin directories
export PATH="/Users/kayosouza/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# LM Studio CLI
export PATH="$PATH:/Users/kayosouza/.cache/lm-studio/bin"

# Android development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

# pnpm
export PNPM_HOME="/Users/kayosouza/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ----------------------------------------------------------------------------
# DEV WORKFLOW ALIASES
# ----------------------------------------------------------------------------
# "It may seem difficult at first, but everything is difficult at first." - Miyamoto Musashi
alias dev="pnpm dev"
alias build="pnpm build"
alias test="pnpm test"
alias lint="pnpm lint"
alias format="pnpm format"
alias ci="pnpm ci"
alias clean="rm -rf node_modules && pnpm install"

# ----------------------------------------------------------------------------
# NAVIGATION
# ----------------------------------------------------------------------------
# "Step by step walk the thousand-mile road." - Miyamoto Musashi
alias blog="cd ~/kinho-dev"
alias work="cd ~/Dev"

# ----------------------------------------------------------------------------
# GIT SHORTCUTS
# ----------------------------------------------------------------------------
# "Do nothing that is of no use." - Miyamoto Musashi
alias gs="git status"
alias gp="git pull"
alias gpu="git push"
alias gc="git commit -m"
alias ga="git add ."
alias gaa="git add --all"

# ----------------------------------------------------------------------------
# COMMIT WORKFLOWS
# ----------------------------------------------------------------------------
# "Today is victory over yourself of yesterday; tomorrow is your victory over lesser men." - Miyamoto Musashi
quickcommit() {
  git add .
  git commit -m "$1 - $(date '+%Y-%m-%d %H:%M:%S')"
  git push
}

# Smart commit with checks
smartcommit() {
  echo "Running checks..."
  pnpm lint && pnpm typecheck && pnpm test
  if [ $? -eq 0 ]; then
    read "message?Commit message: "
    git add .
    git commit -m "$message - $(date '+%Y-%m-%d %H:%M:%S')"
    git push
    echo "Successfully committed and pushed!"
  else
    echo "Checks failed. Fix errors before committing."
    return 1
  fi
}

# ----------------------------------------------------------------------------
# DEPLOYMENT
# ----------------------------------------------------------------------------
# "The true science of martial arts means practicing them in such a way
#  that they will be useful at any time." - Miyamoto Musashi

alias vdeploy="vercel deploy"
alias vprod="vercel --prod"

# ----------------------------------------------------------------------------
# ZSH PLUGINS
# ----------------------------------------------------------------------------
# "From one thing, know ten thousand things." - Miyamoto Musashi

# Fish-like autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting (must be last)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History substring search
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# fzf fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ----------------------------------------------------------------------------
# STARSHIP PROMPT
# ----------------------------------------------------------------------------
# "Perceive that which cannot be seen with the eye." - Miyamoto Musashi

eval "$(starship init zsh)"

# ----------------------------------------------------------------------------
# ============================================================================
# "The way is in training." - Miyamoto Musashi
# ============================================================================
