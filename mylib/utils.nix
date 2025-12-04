/*
  scanPaths: path:
    Returns a list of strings containing the "direct children" (non-recursive)
    of the given directory `path`:
      - all entries recognized as directories (type == "directory")
      - all files ending with ".nix", but explicitly excluding "default.nix"

  Description:
    - Uses builtins.readDir path to obtain the entries in the directory (an attrset
      mapping name -> "file" | "directory").
    - Uses lib.attrsets.filterAttrs to keep only directories or files that
      are not "default.nix" and have a ".nix" suffix.
    - Maps the filtered attribute names to full paths by concatenating path and name.
    - Returns a list of strings, e.g. "/some/dir/foo.nix" or "/some/dir/subdir".

  Arguments:
    path : string
      The directory path to scan. Must exist and be readable by builtins.readDir,
      otherwise an error will be thrown.

  Returns:
    list(string) — full paths of matching entries, e.g. "/some/dir/overlay" or
    "/some/dir/example.nix".

  Example:
    Given directory /home/user/overlays containing:
      - overlayA/        (directory)
      - overlayB/        (directory)
      - example.nix      (file)
      - default.nix      (file)
      - README.md        (file)

    scanPaths "/home/user/overlays" may return (order depends on builtins.attrNames):
      [
        "/home/user/overlays/overlayA"
        "/home/user/overlays/overlayB"
        "/home/user/overlays/example.nix"
      ]
    Note: "/home/user/overlays/default.nix" is excluded, README.md (non-.nix) is excluded.

  Typical usage:
    # Import each overlay or .nix file
    let paths = utils.scanPaths ./overlays; in map (p: import p) paths

  Notes and pitfalls:
    - This scans only the immediate children of the directory; it does not recurse.
      Implement recursion externally if you need it.
    - The order returned by builtins.attrNames is not guaranteed. If callers require
      a stable order, they should sort the list explicitly (e.g., builtins.sort).
    - If a .nix file is syntactically invalid, importing it later will fail. Callers
      should validate or handle import errors as needed.
    - Excluding "default.nix" is an intentional choice to avoid treating a directory's
      top-level default file as an iterable entry. Remove that exclusion if undesired.

  Type signature (reference):
    string -> list string
*/

{ lib }:
{
  scanPaths =
    path:
    path
    |> builtins.readDir
    |> (lib.filterAttrs (name: type: name != "default.nix")) # filter default.nix
    |> (lib.filterAttrs (name: type: type == "directory" || lib.hasSuffix ".nix" name)) # keep dirs and .nix files
    |> builtins.attrNames
    |> map (name: path + "/${name}");
}
