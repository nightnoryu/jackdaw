# jackdaw

My laptop configuration, managed with [mise](https://mise.jdx.dev).

## Bootstrap

1. Copy the wallpapers

    ```shell
    mkdir -p ~/pictures
    cp -r wallpapers ~/pictures
    ```

2. Run mise

    ```shell
    mise dot apply
    ```

    This will create symlinks for all the configs in your home directory.
