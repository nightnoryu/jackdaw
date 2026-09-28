# jackdaw

My laptop configuration, managed with [mise](https://mise.jdx.dev).

## Bootstrap

1. Install mise - see [docs](https://mise.jdx.dev/installing-mise.html)

2. Copy the wallpapers

    ```shell
    mkdir -p ~/pictures
    cp -r wallpapers ~/pictures
    ```

3. Apply the mise config

    ```shell
    mise dot apply
    ```

    This will create symlinks for all the configs in your home directory.
