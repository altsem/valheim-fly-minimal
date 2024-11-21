# Valheim on Fly.io

1. Configure `fly.toml`
  - You may want to change the password, set the server name etc.
  - The VM memory is set to just 512mb, with a 4gb swap.
    Nvme drives are fast, and this configuration seems to run just fine.
2. `flyctl launch`
  - Be sure to enable a paid dedicated IPv4, required since Valheim talks over UDP.
