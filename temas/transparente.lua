local OrionLib = {
	Elements = {},
	ThemeObjects = {},
	Connections = {},
	Flags = {},
	Themes = {
		Default = {
			Main = Color3.fromRGB(0, 0, 0),
			Second = Color3.fromRGB(10, 10, 10),
			Stroke = Color3.fromRGB(210, 105, 30),
			Divider = Color3.fromRGB(60, 60, 60),
			Text = Color3.fromRGB(240,240,240),
			TextDark = Color3.fromRGB(150, 150, 150)
		}
	},
	SelectedTheme = "Default",
	Folder = nil,
	SaveCfg = false
}
