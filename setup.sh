#!/bin/bash

# =============================================================================
# Log System
# =============================================================================

LOG_DIR="$HOME/.log-satellaos-install-tool-cr-for-arch-testing/logs"
MASTER_LOG="$LOG_DIR/install.log"
FAILED_STEPS=()

mkdir -p "$LOG_DIR"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$MASTER_LOG"
}

run_step() {
    local step_num="$1"
    local step_name="$2"
    local cmd="$3"
    local optional="${4:-false}"
    local step_log="$LOG_DIR/${step_num}-${step_name}.log"

    log "--------------------------------------------------------------"
    log "START  >> Step $step_num: $step_name"

    if (set -o pipefail; eval "$cmd" 2>&1 | tee "$step_log"); then
        log "OK     >> Step $step_num: $step_name"
    else
        local exit_code=$?
        log "FAILED >> Step $step_num: $step_name (exit code: $exit_code)"
        log "         Log: $step_log"

        if [ "$optional" = "true" ]; then
            log "INFO   >> Step $step_num is optional, continuing..."
        else
            FAILED_STEPS+=("$step_num-$step_name")
            log "ERROR  >> Non-optional step failed. Aborting."
            log "--------------------------------------------------------------"
            print_summary
            exit 1
        fi
    fi
}

print_summary() {
    log "=============================================================="
    log "INSTALL SUMMARY"
    log "=============================================================="
    if [ ${#FAILED_STEPS[@]} -eq 0 ]; then
        log "STATUS: All steps completed successfully."
    else
        log "STATUS: Installation failed."
        log "Failed steps:"
        for step in "${FAILED_STEPS[@]}"; do
            log "  - $step"
        done
    fi
    log "Master log : $MASTER_LOG"
    log "Step logs  : $LOG_DIR/"
    log "=============================================================="
}

# =============================================================================
# Main
# =============================================================================

log "=============================================================="
log "Installing The SatellaOS System"
log "=============================================================="

Base=$HOME/satellaos-install-tool-cr-for-arch-testing/tree-installer-system

# =============================================================================
# Steps
# optional=true  → failure is logged but install continues
# optional=false → failure aborts the install (default)
# =============================================================================

run_step "01" "dependencies"                    "bash    $Base/dependencies/run.sh"
run_step "02" "install-network-manager"         "bash    $Base/install-network-manager/run.sh"
# run_step "03" "enabling-multilib-repo"          "bash    $Base/enabling-multilib-repo/run.sh"
run_step "03" "yay"                             "bash    $Base/yay/run.sh"
run_step "04" "flatpak"                         "bash    $Base/flatpak/run.sh"
run_step "05" "core"                            "bash    $Base/core/run.sh"
run_step "06" "update-os-release"               "bash    $Base/update-os-release/run.sh"
run_step "07" "grub-settings"                   "bash    $Base/grub-settings/run.sh"
run_step "08" "lightdm-settings"                "bash    $Base/lightdm-settings/run.sh"
run_step "09" "themes"                          "bash    $Base/themes/run.sh"
run_step "10" "grub-theme"                      "bash    $Base/grub-theme/run.sh"
run_step "11" "pictures"                        "bash    $Base/pictures/run.sh"
#run_step "12" "user-configuration-settings"     "bash    $Base/user-configuration-settings/run.sh"
#run_step "13" "skel-configuration-settings"     "bash    $Base/skel-configuration-settings/run.sh"
#run_step "14" "fastfetch"                       "bash    $Base/fastfetch/run.sh"

print_summary
