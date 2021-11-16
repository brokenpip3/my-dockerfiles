# My dockerfiles

Miscellaneous docker images that I use on a daily basis

## Build directives

- User directive
- Opencontainers [annotations](https://github.com/opencontainers/image-spec/blob/main/annotations.md#pre-defined-annotation-keys)
- Use [distroless](https://github.com/GoogleContainerTools/distroless) images or `FROM scratch` when possible (only apps)
- Use expose directive when possible
- Executable owned by root
- Entrypoint/command not writable, only executable

## Credits

Some of these dockerfiles were created inspired by articles, examples or
suggestions found somewhere. Others were replicated here due to zero trust of the upstream.
The credits are always reported on the first line if one of these cases.
