# jackdaw

My laptop configuration, managed with GNU Stow.

## Structure

- `.config/` - Application configuration
- `wallpapers/` - Wallpapers
- `link-configs` - Helper for creating symlinks

## Bootstrap

1. Run the script

    ```shell
    ./link-configs
    ```

    This will create symlinks for all the configs in your home directory.

2. Copy the wallpapers

    ```shell
    mkdir -p ~/pictures
    cp -r wallpapers ~/pictures
    ```
