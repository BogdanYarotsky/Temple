using System.Diagnostics;
using static System.Console;
using static System.Text.Json.JsonSerializer;
using CliWrap;
using CliWrap.Buffered;

public static class Program
{
    public static async Task Main(string[] args)
    {
        // check current directory
        // find csproj - if not found - return

        // if npm not installed - terminate
        // if vite not installed - install
        var result = await Cli.Wrap("npm")
            .WithArguments(new []
            {
                "create", "vite@latest", "ui2", "--", "--template", "react-swc-ts"
            })
            .ExecuteBufferedAsync();

    }
}