# Example ExportedZip:
# This is the name of the exported OS X ZIP from Godot
$ExportedZip = "SurvivalScapeOSX.zip"

# Example Paths:
# This is the path the Zips exist in
$Paths = @(
"C:\Source\SurvivalScape\Build\Mac Demo\SurvivalScapeOSX.zip"
"C:\Source\SurvivalScape\Build\Mac\SurvivalScapeOSX.zip"
)

# For each path:
# Extract using 7-zip and delete ZIP files
foreach ($path in $paths) {
    $destination = $Path.Replace($ExportedZip, "")

    # Extract contents to the same directory
    & ${env:ProgramFiles}\7-Zip\7z.exe x $path "-o$($destination)" -y

    # Delete the zip files after extraction
    Remove-Item $path
}