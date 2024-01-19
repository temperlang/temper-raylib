local ffi = require("ffi")
local rl = {}
rl.GuiStyleProp = ffi.typeof("struct GuiStyleProp")rl.GuiTextStyle = ffi.typeof("struct GuiTextStyle")rl.Vector2 = ffi.typeof("struct Vector2")rl.Vector3 = ffi.typeof("struct Vector3")rl.Vector4 = ffi.typeof("struct Vector4")rl.Matrix = ffi.typeof("struct Matrix")rl.Color = ffi.typeof("struct Color")rl.Rectangle = ffi.typeof("struct Rectangle")rl.Image = ffi.typeof("struct Image")rl.Texture = ffi.typeof("struct Texture")rl.RenderTexture = ffi.typeof("struct RenderTexture")rl.NPatchInfo = ffi.typeof("struct NPatchInfo")rl.GlyphInfo = ffi.typeof("struct GlyphInfo")rl.Font = ffi.typeof("struct Font")rl.Camera3D = ffi.typeof("struct Camera3D")rl.Camera2D = ffi.typeof("struct Camera2D")rl.Mesh = ffi.typeof("struct Mesh")rl.Shader = ffi.typeof("struct Shader")rl.MaterialMap = ffi.typeof("struct MaterialMap")rl.Material = ffi.typeof("struct Material")rl.Transform = ffi.typeof("struct Transform")rl.BoneInfo = ffi.typeof("struct BoneInfo")rl.Model = ffi.typeof("struct Model")rl.ModelAnimation = ffi.typeof("struct ModelAnimation")rl.Ray = ffi.typeof("struct Ray")rl.RayCollision = ffi.typeof("struct RayCollision")rl.BoundingBox = ffi.typeof("struct BoundingBox")rl.Wave = ffi.typeof("struct Wave")rl.AudioStream = ffi.typeof("struct AudioStream")rl.Sound = ffi.typeof("struct Sound")rl.Music = ffi.typeof("struct Music")rl.VrDeviceInfo = ffi.typeof("struct VrDeviceInfo")rl.VrStereoConfig = ffi.typeof("struct VrStereoConfig")rl.FilePathList = ffi.typeof("struct FilePathList")rl.AutomationEvent = ffi.typeof("struct AutomationEvent")rl.AutomationEventList = ffi.typeof("struct AutomationEventList")rl.float3 = ffi.typeof("struct float3")rl.float16 = ffi.typeof("struct float16")rl.rlVertexBuffer = ffi.typeof("struct rlVertexBuffer")rl.rlDrawCall = ffi.typeof("struct rlDrawCall")rl.rlRenderBatch = ffi.typeof("struct rlRenderBatch")function rl:GuiEnable()
  rl.lib.GuiEnable()
end
function rl:GuiDisable()
  rl.lib.GuiDisable()
end
function rl:GuiLock()
  rl.lib.GuiLock()
end
function rl:GuiUnlock()
  rl.lib.GuiUnlock()
end
function rl:GuiIsLocked()
  return rl.lib.GuiIsLocked()
end
function rl:GuiSetAlpha(alpha)
  rl.lib.GuiSetAlpha(alpha)
end
function rl:GuiSetState(state)
  rl.lib.GuiSetState(state)
end
function rl:GuiGetState()
  return rl.lib.GuiGetState()
end
function rl:GuiSetFont(font)
  rl.lib.GuiSetFont(font)
end
function rl:GuiGetFont()
  return rl.lib.GuiGetFont()
end
function rl:GuiSetStyle(control, property, value)
  rl.lib.GuiSetStyle(control, property, value)
end
function rl:GuiGetStyle(control, property)
  return rl.lib.GuiGetStyle(control, property)
end
function rl:GuiLoadStyle(fileName)
  rl.lib.GuiLoadStyle(rl.char_ptr(fileName))
end
function rl:GuiLoadStyleDefault()
  rl.lib.GuiLoadStyleDefault()
end
function rl:GuiEnableTooltip()
  rl.lib.GuiEnableTooltip()
end
function rl:GuiDisableTooltip()
  rl.lib.GuiDisableTooltip()
end
function rl:GuiSetTooltip(tooltip)
  rl.lib.GuiSetTooltip(rl.char_ptr(tooltip))
end
function rl:GuiIconText(iconId, text)
  return ffi.string(rl.lib.GuiIconText(iconId, rl.char_ptr(text)))
end
function rl:GuiWindowBox(bounds, title)
  return rl.lib.GuiWindowBox(bounds, rl.char_ptr(title))
end
function rl:GuiGroupBox(bounds, text)
  return rl.lib.GuiGroupBox(bounds, rl.char_ptr(text))
end
function rl:GuiLine(bounds, text)
  return rl.lib.GuiLine(bounds, rl.char_ptr(text))
end
function rl:GuiPanel(bounds, text)
  return rl.lib.GuiPanel(bounds, rl.char_ptr(text))
end
function rl:GuiTabBar(bounds, text, count, active)
  return rl.lib.GuiTabBar(bounds, text, count, active)
end
function rl:GuiScrollPanel(bounds, text, content, scroll, view)
  return rl.lib.GuiScrollPanel(bounds, rl.char_ptr(text), content, scroll, view)
end
function rl:GuiLabel(bounds, text)
  return rl.lib.GuiLabel(bounds, rl.char_ptr(text))
end
function rl:GuiButton(bounds, text)
  return rl.lib.GuiButton(bounds, rl.char_ptr(text))
end
function rl:GuiLabelButton(bounds, text)
  return rl.lib.GuiLabelButton(bounds, rl.char_ptr(text))
end
function rl:GuiToggle(bounds, text, active)
  return rl.lib.GuiToggle(bounds, rl.char_ptr(text), active)
end
function rl:GuiToggleGroup(bounds, text, active)
  return rl.lib.GuiToggleGroup(bounds, rl.char_ptr(text), active)
end
function rl:GuiToggleSlider(bounds, text, active)
  return rl.lib.GuiToggleSlider(bounds, rl.char_ptr(text), active)
end
function rl:GuiCheckBox(bounds, text, checked)
  return rl.lib.GuiCheckBox(bounds, rl.char_ptr(text), checked)
end
function rl:GuiComboBox(bounds, text, active)
  return rl.lib.GuiComboBox(bounds, rl.char_ptr(text), active)
end
function rl:GuiDropdownBox(bounds, text, active, editMode)
  return rl.lib.GuiDropdownBox(bounds, rl.char_ptr(text), active, editMode)
end
function rl:GuiSpinner(bounds, text, value, minValue, maxValue, editMode)
  return rl.lib.GuiSpinner(bounds, rl.char_ptr(text), value, minValue, maxValue, editMode)
end
function rl:GuiValueBox(bounds, text, value, minValue, maxValue, editMode)
  return rl.lib.GuiValueBox(bounds, rl.char_ptr(text), value, minValue, maxValue, editMode)
end
function rl:GuiTextBox(bounds, text, textSize, editMode)
  return rl.lib.GuiTextBox(bounds, rl.char_ptr(text), textSize, editMode)
end
function rl:GuiSlider(bounds, textLeft, textRight, value, minValue, maxValue)
  return rl.lib.GuiSlider(bounds, rl.char_ptr(textLeft), rl.char_ptr(textRight), value, minValue, maxValue)
end
function rl:GuiSliderBar(bounds, textLeft, textRight, value, minValue, maxValue)
  return rl.lib.GuiSliderBar(bounds, rl.char_ptr(textLeft), rl.char_ptr(textRight), value, minValue, maxValue)
end
function rl:GuiProgressBar(bounds, textLeft, textRight, value, minValue, maxValue)
  return rl.lib.GuiProgressBar(bounds, rl.char_ptr(textLeft), rl.char_ptr(textRight), value, minValue, maxValue)
end
function rl:GuiStatusBar(bounds, text)
  return rl.lib.GuiStatusBar(bounds, rl.char_ptr(text))
end
function rl:GuiDummyRec(bounds, text)
  return rl.lib.GuiDummyRec(bounds, rl.char_ptr(text))
end
function rl:GuiGrid(bounds, text, spacing, subdivs, mouseCell)
  return rl.lib.GuiGrid(bounds, rl.char_ptr(text), spacing, subdivs, mouseCell)
end
function rl:GuiListView(bounds, text, scrollIndex, active)
  return rl.lib.GuiListView(bounds, rl.char_ptr(text), scrollIndex, active)
end
function rl:GuiListViewEx(bounds, text, count, scrollIndex, active, focus)
  return rl.lib.GuiListViewEx(bounds, text, count, scrollIndex, active, focus)
end
function rl:GuiMessageBox(bounds, title, message, buttons)
  return rl.lib.GuiMessageBox(bounds, rl.char_ptr(title), rl.char_ptr(message), rl.char_ptr(buttons))
end
function rl:GuiTextInputBox(bounds, title, message, buttons, text, textMaxSize, secretViewActive)
  return rl.lib.GuiTextInputBox(bounds, rl.char_ptr(title), rl.char_ptr(message), rl.char_ptr(buttons), rl.char_ptr(text), textMaxSize, secretViewActive)
end
function rl:GuiColorPicker(bounds, text, color)
  return rl.lib.GuiColorPicker(bounds, rl.char_ptr(text), color)
end
function rl:GuiColorPanel(bounds, text, color)
  return rl.lib.GuiColorPanel(bounds, rl.char_ptr(text), color)
end
function rl:GuiColorBarAlpha(bounds, text, alpha)
  return rl.lib.GuiColorBarAlpha(bounds, rl.char_ptr(text), alpha)
end
function rl:GuiColorBarHue(bounds, text, value)
  return rl.lib.GuiColorBarHue(bounds, rl.char_ptr(text), value)
end
function rl:GuiColorPickerHSV(bounds, text, colorHsv)
  return rl.lib.GuiColorPickerHSV(bounds, rl.char_ptr(text), colorHsv)
end
function rl:GuiColorPanelHSV(bounds, text, colorHsv)
  return rl.lib.GuiColorPanelHSV(bounds, rl.char_ptr(text), colorHsv)
end
function rl:InitWindow(width, height, title)
  rl.lib.InitWindow(width, height, rl.char_ptr(title))
end
function rl:CloseWindow()
  rl.lib.CloseWindow()
end
function rl:WindowShouldClose()
  return rl.lib.WindowShouldClose()
end
function rl:IsWindowReady()
  return rl.lib.IsWindowReady()
end
function rl:IsWindowFullscreen()
  return rl.lib.IsWindowFullscreen()
end
function rl:IsWindowHidden()
  return rl.lib.IsWindowHidden()
end
function rl:IsWindowMinimized()
  return rl.lib.IsWindowMinimized()
end
function rl:IsWindowMaximized()
  return rl.lib.IsWindowMaximized()
end
function rl:IsWindowFocused()
  return rl.lib.IsWindowFocused()
end
function rl:IsWindowResized()
  return rl.lib.IsWindowResized()
end
function rl:IsWindowState(flag)
  return rl.lib.IsWindowState(flag)
end
function rl:SetWindowState(flags)
  rl.lib.SetWindowState(flags)
end
function rl:ClearWindowState(flags)
  rl.lib.ClearWindowState(flags)
end
function rl:ToggleFullscreen()
  rl.lib.ToggleFullscreen()
end
function rl:ToggleBorderlessWindowed()
  rl.lib.ToggleBorderlessWindowed()
end
function rl:MaximizeWindow()
  rl.lib.MaximizeWindow()
end
function rl:MinimizeWindow()
  rl.lib.MinimizeWindow()
end
function rl:RestoreWindow()
  rl.lib.RestoreWindow()
end
function rl:SetWindowIcon(image)
  rl.lib.SetWindowIcon(image)
end
function rl:SetWindowIcons(images, count)
  rl.lib.SetWindowIcons(images, count)
end
function rl:SetWindowTitle(title)
  rl.lib.SetWindowTitle(rl.char_ptr(title))
end
function rl:SetWindowPosition(x, y)
  rl.lib.SetWindowPosition(x, y)
end
function rl:SetWindowMonitor(monitor)
  rl.lib.SetWindowMonitor(monitor)
end
function rl:SetWindowMinSize(width, height)
  rl.lib.SetWindowMinSize(width, height)
end
function rl:SetWindowMaxSize(width, height)
  rl.lib.SetWindowMaxSize(width, height)
end
function rl:SetWindowSize(width, height)
  rl.lib.SetWindowSize(width, height)
end
function rl:SetWindowOpacity(opacity)
  rl.lib.SetWindowOpacity(opacity)
end
function rl:SetWindowFocused()
  rl.lib.SetWindowFocused()
end
function rl:GetWindowHandle()
  return rl.lib.GetWindowHandle()
end
function rl:GetScreenWidth()
  return rl.lib.GetScreenWidth()
end
function rl:GetScreenHeight()
  return rl.lib.GetScreenHeight()
end
function rl:GetRenderWidth()
  return rl.lib.GetRenderWidth()
end
function rl:GetRenderHeight()
  return rl.lib.GetRenderHeight()
end
function rl:GetMonitorCount()
  return rl.lib.GetMonitorCount()
end
function rl:GetCurrentMonitor()
  return rl.lib.GetCurrentMonitor()
end
function rl:GetMonitorPosition(monitor)
  return rl.lib.GetMonitorPosition(monitor)
end
function rl:GetMonitorWidth(monitor)
  return rl.lib.GetMonitorWidth(monitor)
end
function rl:GetMonitorHeight(monitor)
  return rl.lib.GetMonitorHeight(monitor)
end
function rl:GetMonitorPhysicalWidth(monitor)
  return rl.lib.GetMonitorPhysicalWidth(monitor)
end
function rl:GetMonitorPhysicalHeight(monitor)
  return rl.lib.GetMonitorPhysicalHeight(monitor)
end
function rl:GetMonitorRefreshRate(monitor)
  return rl.lib.GetMonitorRefreshRate(monitor)
end
function rl:GetWindowPosition()
  return rl.lib.GetWindowPosition()
end
function rl:GetWindowScaleDPI()
  return rl.lib.GetWindowScaleDPI()
end
function rl:GetMonitorName(monitor)
  return ffi.string(rl.lib.GetMonitorName(monitor))
end
function rl:SetClipboardText(text)
  rl.lib.SetClipboardText(rl.char_ptr(text))
end
function rl:GetClipboardText()
  return ffi.string(rl.lib.GetClipboardText())
end
function rl:EnableEventWaiting()
  rl.lib.EnableEventWaiting()
end
function rl:DisableEventWaiting()
  rl.lib.DisableEventWaiting()
end
function rl:ShowCursor()
  rl.lib.ShowCursor()
end
function rl:HideCursor()
  rl.lib.HideCursor()
end
function rl:IsCursorHidden()
  return rl.lib.IsCursorHidden()
end
function rl:EnableCursor()
  rl.lib.EnableCursor()
end
function rl:DisableCursor()
  rl.lib.DisableCursor()
end
function rl:IsCursorOnScreen()
  return rl.lib.IsCursorOnScreen()
end
function rl:ClearBackground(color)
  rl.lib.ClearBackground(color)
end
function rl:BeginDrawing()
  rl.lib.BeginDrawing()
end
function rl:EndDrawing()
  rl.lib.EndDrawing()
end
function rl:BeginMode2D(camera)
  rl.lib.BeginMode2D(camera)
end
function rl:EndMode2D()
  rl.lib.EndMode2D()
end
function rl:BeginMode3D(camera)
  rl.lib.BeginMode3D(camera)
end
function rl:EndMode3D()
  rl.lib.EndMode3D()
end
function rl:BeginTextureMode(target)
  rl.lib.BeginTextureMode(target)
end
function rl:EndTextureMode()
  rl.lib.EndTextureMode()
end
function rl:BeginShaderMode(shader)
  rl.lib.BeginShaderMode(shader)
end
function rl:EndShaderMode()
  rl.lib.EndShaderMode()
end
function rl:BeginBlendMode(mode)
  rl.lib.BeginBlendMode(mode)
end
function rl:EndBlendMode()
  rl.lib.EndBlendMode()
end
function rl:BeginScissorMode(x, y, width, height)
  rl.lib.BeginScissorMode(x, y, width, height)
end
function rl:EndScissorMode()
  rl.lib.EndScissorMode()
end
function rl:BeginVrStereoMode(config)
  rl.lib.BeginVrStereoMode(config)
end
function rl:EndVrStereoMode()
  rl.lib.EndVrStereoMode()
end
function rl:LoadVrStereoConfig(device)
  return rl.lib.LoadVrStereoConfig(device)
end
function rl:UnloadVrStereoConfig(config)
  rl.lib.UnloadVrStereoConfig(config)
end
function rl:LoadShader(vsFileName, fsFileName)
  return rl.lib.LoadShader(rl.char_ptr(vsFileName), rl.char_ptr(fsFileName))
end
function rl:LoadShaderFromMemory(vsCode, fsCode)
  return rl.lib.LoadShaderFromMemory(rl.char_ptr(vsCode), rl.char_ptr(fsCode))
end
function rl:IsShaderReady(shader)
  return rl.lib.IsShaderReady(shader)
end
function rl:GetShaderLocation(shader, uniformName)
  return rl.lib.GetShaderLocation(shader, rl.char_ptr(uniformName))
end
function rl:GetShaderLocationAttrib(shader, attribName)
  return rl.lib.GetShaderLocationAttrib(shader, rl.char_ptr(attribName))
end
function rl:SetShaderValue(shader, locIndex, value, uniformType)
  rl.lib.SetShaderValue(shader, locIndex, value, uniformType)
end
function rl:SetShaderValueV(shader, locIndex, value, uniformType, count)
  rl.lib.SetShaderValueV(shader, locIndex, value, uniformType, count)
end
function rl:SetShaderValueMatrix(shader, locIndex, mat)
  rl.lib.SetShaderValueMatrix(shader, locIndex, mat)
end
function rl:SetShaderValueTexture(shader, locIndex, texture)
  rl.lib.SetShaderValueTexture(shader, locIndex, texture)
end
function rl:UnloadShader(shader)
  rl.lib.UnloadShader(shader)
end
function rl:GetMouseRay(mousePosition, camera)
  return rl.lib.GetMouseRay(mousePosition, camera)
end
function rl:GetCameraMatrix(camera)
  return rl.lib.GetCameraMatrix(camera)
end
function rl:GetCameraMatrix2D(camera)
  return rl.lib.GetCameraMatrix2D(camera)
end
function rl:GetWorldToScreen(position, camera)
  return rl.lib.GetWorldToScreen(position, camera)
end
function rl:GetScreenToWorld2D(position, camera)
  return rl.lib.GetScreenToWorld2D(position, camera)
end
function rl:GetWorldToScreenEx(position, camera, width, height)
  return rl.lib.GetWorldToScreenEx(position, camera, width, height)
end
function rl:GetWorldToScreen2D(position, camera)
  return rl.lib.GetWorldToScreen2D(position, camera)
end
function rl:SetTargetFPS(fps)
  rl.lib.SetTargetFPS(fps)
end
function rl:GetFrameTime()
  return rl.lib.GetFrameTime()
end
function rl:GetTime()
  return rl.lib.GetTime()
end
function rl:GetFPS()
  return rl.lib.GetFPS()
end
function rl:SwapScreenBuffer()
  rl.lib.SwapScreenBuffer()
end
function rl:PollInputEvents()
  rl.lib.PollInputEvents()
end
function rl:WaitTime(seconds)
  rl.lib.WaitTime(seconds)
end
function rl:SetRandomSeed(seed)
  rl.lib.SetRandomSeed(seed)
end
function rl:GetRandomValue(min, max)
  return rl.lib.GetRandomValue(min, max)
end
function rl:LoadRandomSequence(count, min, max)
  return rl.lib.LoadRandomSequence(count, min, max)
end
function rl:UnloadRandomSequence(sequence)
  rl.lib.UnloadRandomSequence(sequence)
end
function rl:TakeScreenshot(fileName)
  rl.lib.TakeScreenshot(rl.char_ptr(fileName))
end
function rl:SetConfigFlags(flags)
  rl.lib.SetConfigFlags(flags)
end
function rl:OpenURL(url)
  rl.lib.OpenURL(rl.char_ptr(url))
end
function rl:TraceLog(logLevel, text, args)
  rl.lib.TraceLog(logLevel, rl.char_ptr(text), args)
end
function rl:SetTraceLogLevel(logLevel)
  rl.lib.SetTraceLogLevel(logLevel)
end
function rl:MemAlloc(size)
  return rl.lib.MemAlloc(size)
end
function rl:MemRealloc(ptr, size)
  return rl.lib.MemRealloc(ptr, size)
end
function rl:MemFree(ptr)
  rl.lib.MemFree(ptr)
end
function rl:LoadFileData(fileName, dataSize)
  return rl.lib.LoadFileData(rl.char_ptr(fileName), dataSize)
end
function rl:UnloadFileData(data)
  rl.lib.UnloadFileData(data)
end
function rl:SaveFileData(fileName, data, dataSize)
  return rl.lib.SaveFileData(rl.char_ptr(fileName), data, dataSize)
end
function rl:ExportDataAsCode(data, dataSize, fileName)
  return rl.lib.ExportDataAsCode(data, dataSize, rl.char_ptr(fileName))
end
function rl:LoadFileText(fileName)
  return ffi.string(rl.lib.LoadFileText(rl.char_ptr(fileName)))
end
function rl:UnloadFileText(text)
  rl.lib.UnloadFileText(rl.char_ptr(text))
end
function rl:SaveFileText(fileName, text)
  return rl.lib.SaveFileText(rl.char_ptr(fileName), rl.char_ptr(text))
end
function rl:FileExists(fileName)
  return rl.lib.FileExists(rl.char_ptr(fileName))
end
function rl:DirectoryExists(dirPath)
  return rl.lib.DirectoryExists(rl.char_ptr(dirPath))
end
function rl:IsFileExtension(fileName, ext)
  return rl.lib.IsFileExtension(rl.char_ptr(fileName), rl.char_ptr(ext))
end
function rl:GetFileLength(fileName)
  return rl.lib.GetFileLength(rl.char_ptr(fileName))
end
function rl:GetFileExtension(fileName)
  return ffi.string(rl.lib.GetFileExtension(rl.char_ptr(fileName)))
end
function rl:GetFileName(filePath)
  return ffi.string(rl.lib.GetFileName(rl.char_ptr(filePath)))
end
function rl:GetFileNameWithoutExt(filePath)
  return ffi.string(rl.lib.GetFileNameWithoutExt(rl.char_ptr(filePath)))
end
function rl:GetDirectoryPath(filePath)
  return ffi.string(rl.lib.GetDirectoryPath(rl.char_ptr(filePath)))
end
function rl:GetPrevDirectoryPath(dirPath)
  return ffi.string(rl.lib.GetPrevDirectoryPath(rl.char_ptr(dirPath)))
end
function rl:GetWorkingDirectory()
  return ffi.string(rl.lib.GetWorkingDirectory())
end
function rl:GetApplicationDirectory()
  return ffi.string(rl.lib.GetApplicationDirectory())
end
function rl:ChangeDirectory(dir)
  return rl.lib.ChangeDirectory(rl.char_ptr(dir))
end
function rl:IsPathFile(path)
  return rl.lib.IsPathFile(rl.char_ptr(path))
end
function rl:LoadDirectoryFiles(dirPath)
  return rl.lib.LoadDirectoryFiles(rl.char_ptr(dirPath))
end
function rl:LoadDirectoryFilesEx(basePath, filter, scanSubdirs)
  return rl.lib.LoadDirectoryFilesEx(rl.char_ptr(basePath), rl.char_ptr(filter), scanSubdirs)
end
function rl:UnloadDirectoryFiles(files)
  rl.lib.UnloadDirectoryFiles(files)
end
function rl:IsFileDropped()
  return rl.lib.IsFileDropped()
end
function rl:LoadDroppedFiles()
  return rl.lib.LoadDroppedFiles()
end
function rl:UnloadDroppedFiles(files)
  rl.lib.UnloadDroppedFiles(files)
end
function rl:GetFileModTime(fileName)
  return rl.lib.GetFileModTime(rl.char_ptr(fileName))
end
function rl:CompressData(data, dataSize, compDataSize)
  return rl.lib.CompressData(data, dataSize, compDataSize)
end
function rl:DecompressData(compData, compDataSize, dataSize)
  return rl.lib.DecompressData(compData, compDataSize, dataSize)
end
function rl:EncodeDataBase64(data, dataSize, outputSize)
  return ffi.string(rl.lib.EncodeDataBase64(data, dataSize, outputSize))
end
function rl:DecodeDataBase64(data, outputSize)
  return rl.lib.DecodeDataBase64(data, outputSize)
end
function rl:LoadAutomationEventList(fileName)
  return rl.lib.LoadAutomationEventList(rl.char_ptr(fileName))
end
function rl:UnloadAutomationEventList(list)
  rl.lib.UnloadAutomationEventList(list)
end
function rl:ExportAutomationEventList(list, fileName)
  return rl.lib.ExportAutomationEventList(list, rl.char_ptr(fileName))
end
function rl:SetAutomationEventList(list)
  rl.lib.SetAutomationEventList(list)
end
function rl:SetAutomationEventBaseFrame(frame)
  rl.lib.SetAutomationEventBaseFrame(frame)
end
function rl:StartAutomationEventRecording()
  rl.lib.StartAutomationEventRecording()
end
function rl:StopAutomationEventRecording()
  rl.lib.StopAutomationEventRecording()
end
function rl:PlayAutomationEvent(event)
  rl.lib.PlayAutomationEvent(event)
end
function rl:IsKeyPressed(key)
  return rl.lib.IsKeyPressed(key)
end
function rl:IsKeyPressedRepeat(key)
  return rl.lib.IsKeyPressedRepeat(key)
end
function rl:IsKeyDown(key)
  return rl.lib.IsKeyDown(key)
end
function rl:IsKeyReleased(key)
  return rl.lib.IsKeyReleased(key)
end
function rl:IsKeyUp(key)
  return rl.lib.IsKeyUp(key)
end
function rl:GetKeyPressed()
  return rl.lib.GetKeyPressed()
end
function rl:GetCharPressed()
  return rl.lib.GetCharPressed()
end
function rl:SetExitKey(key)
  rl.lib.SetExitKey(key)
end
function rl:IsGamepadAvailable(gamepad)
  return rl.lib.IsGamepadAvailable(gamepad)
end
function rl:GetGamepadName(gamepad)
  return ffi.string(rl.lib.GetGamepadName(gamepad))
end
function rl:IsGamepadButtonPressed(gamepad, button)
  return rl.lib.IsGamepadButtonPressed(gamepad, button)
end
function rl:IsGamepadButtonDown(gamepad, button)
  return rl.lib.IsGamepadButtonDown(gamepad, button)
end
function rl:IsGamepadButtonReleased(gamepad, button)
  return rl.lib.IsGamepadButtonReleased(gamepad, button)
end
function rl:IsGamepadButtonUp(gamepad, button)
  return rl.lib.IsGamepadButtonUp(gamepad, button)
end
function rl:GetGamepadButtonPressed()
  return rl.lib.GetGamepadButtonPressed()
end
function rl:GetGamepadAxisCount(gamepad)
  return rl.lib.GetGamepadAxisCount(gamepad)
end
function rl:GetGamepadAxisMovement(gamepad, axis)
  return rl.lib.GetGamepadAxisMovement(gamepad, axis)
end
function rl:SetGamepadMappings(mappings)
  return rl.lib.SetGamepadMappings(rl.char_ptr(mappings))
end
function rl:IsMouseButtonPressed(button)
  return rl.lib.IsMouseButtonPressed(button)
end
function rl:IsMouseButtonDown(button)
  return rl.lib.IsMouseButtonDown(button)
end
function rl:IsMouseButtonReleased(button)
  return rl.lib.IsMouseButtonReleased(button)
end
function rl:IsMouseButtonUp(button)
  return rl.lib.IsMouseButtonUp(button)
end
function rl:GetMouseX()
  return rl.lib.GetMouseX()
end
function rl:GetMouseY()
  return rl.lib.GetMouseY()
end
function rl:GetMousePosition()
  return rl.lib.GetMousePosition()
end
function rl:GetMouseDelta()
  return rl.lib.GetMouseDelta()
end
function rl:SetMousePosition(x, y)
  rl.lib.SetMousePosition(x, y)
end
function rl:SetMouseOffset(offsetX, offsetY)
  rl.lib.SetMouseOffset(offsetX, offsetY)
end
function rl:SetMouseScale(scaleX, scaleY)
  rl.lib.SetMouseScale(scaleX, scaleY)
end
function rl:GetMouseWheelMove()
  return rl.lib.GetMouseWheelMove()
end
function rl:GetMouseWheelMoveV()
  return rl.lib.GetMouseWheelMoveV()
end
function rl:SetMouseCursor(cursor)
  rl.lib.SetMouseCursor(cursor)
end
function rl:GetTouchX()
  return rl.lib.GetTouchX()
end
function rl:GetTouchY()
  return rl.lib.GetTouchY()
end
function rl:GetTouchPosition(index)
  return rl.lib.GetTouchPosition(index)
end
function rl:GetTouchPointId(index)
  return rl.lib.GetTouchPointId(index)
end
function rl:GetTouchPointCount()
  return rl.lib.GetTouchPointCount()
end
function rl:SetGesturesEnabled(flags)
  rl.lib.SetGesturesEnabled(flags)
end
function rl:IsGestureDetected(gesture)
  return rl.lib.IsGestureDetected(gesture)
end
function rl:GetGestureDetected()
  return rl.lib.GetGestureDetected()
end
function rl:GetGestureHoldDuration()
  return rl.lib.GetGestureHoldDuration()
end
function rl:GetGestureDragVector()
  return rl.lib.GetGestureDragVector()
end
function rl:GetGestureDragAngle()
  return rl.lib.GetGestureDragAngle()
end
function rl:GetGesturePinchVector()
  return rl.lib.GetGesturePinchVector()
end
function rl:GetGesturePinchAngle()
  return rl.lib.GetGesturePinchAngle()
end
function rl:UpdateCamera(camera, mode)
  rl.lib.UpdateCamera(camera, mode)
end
function rl:UpdateCameraPro(camera, movement, rotation, zoom)
  rl.lib.UpdateCameraPro(camera, movement, rotation, zoom)
end
function rl:SetShapesTexture(texture, source)
  rl.lib.SetShapesTexture(texture, source)
end
function rl:GetShapesTexture()
  return rl.lib.GetShapesTexture()
end
function rl:GetShapesTextureRectangle()
  return rl.lib.GetShapesTextureRectangle()
end
function rl:DrawPixel(posX, posY, color)
  rl.lib.DrawPixel(posX, posY, color)
end
function rl:DrawPixelV(position, color)
  rl.lib.DrawPixelV(position, color)
end
function rl:DrawLine(startPosX, startPosY, endPosX, endPosY, color)
  rl.lib.DrawLine(startPosX, startPosY, endPosX, endPosY, color)
end
function rl:DrawLineV(startPos, endPos, color)
  rl.lib.DrawLineV(startPos, endPos, color)
end
function rl:DrawLineEx(startPos, endPos, thick, color)
  rl.lib.DrawLineEx(startPos, endPos, thick, color)
end
function rl:DrawLineStrip(points, pointCount, color)
  rl.lib.DrawLineStrip(points, pointCount, color)
end
function rl:DrawLineBezier(startPos, endPos, thick, color)
  rl.lib.DrawLineBezier(startPos, endPos, thick, color)
end
function rl:DrawCircle(centerX, centerY, radius, color)
  rl.lib.DrawCircle(centerX, centerY, radius, color)
end
function rl:DrawCircleSector(center, radius, startAngle, endAngle, segments, color)
  rl.lib.DrawCircleSector(center, radius, startAngle, endAngle, segments, color)
end
function rl:DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color)
  rl.lib.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color)
end
function rl:DrawCircleGradient(centerX, centerY, radius, color1, color2)
  rl.lib.DrawCircleGradient(centerX, centerY, radius, color1, color2)
end
function rl:DrawCircleV(center, radius, color)
  rl.lib.DrawCircleV(center, radius, color)
end
function rl:DrawCircleLines(centerX, centerY, radius, color)
  rl.lib.DrawCircleLines(centerX, centerY, radius, color)
end
function rl:DrawCircleLinesV(center, radius, color)
  rl.lib.DrawCircleLinesV(center, radius, color)
end
function rl:DrawEllipse(centerX, centerY, radiusH, radiusV, color)
  rl.lib.DrawEllipse(centerX, centerY, radiusH, radiusV, color)
end
function rl:DrawEllipseLines(centerX, centerY, radiusH, radiusV, color)
  rl.lib.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color)
end
function rl:DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
  rl.lib.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
end
function rl:DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
  rl.lib.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
end
function rl:DrawRectangle(posX, posY, width, height, color)
  rl.lib.DrawRectangle(posX, posY, width, height, color)
end
function rl:DrawRectangleV(position, size, color)
  rl.lib.DrawRectangleV(position, size, color)
end
function rl:DrawRectangleRec(rec, color)
  rl.lib.DrawRectangleRec(rec, color)
end
function rl:DrawRectanglePro(rec, origin, rotation, color)
  rl.lib.DrawRectanglePro(rec, origin, rotation, color)
end
function rl:DrawRectangleGradientV(posX, posY, width, height, color1, color2)
  rl.lib.DrawRectangleGradientV(posX, posY, width, height, color1, color2)
end
function rl:DrawRectangleGradientH(posX, posY, width, height, color1, color2)
  rl.lib.DrawRectangleGradientH(posX, posY, width, height, color1, color2)
end
function rl:DrawRectangleGradientEx(rec, col1, col2, col3, col4)
  rl.lib.DrawRectangleGradientEx(rec, col1, col2, col3, col4)
end
function rl:DrawRectangleLines(posX, posY, width, height, color)
  rl.lib.DrawRectangleLines(posX, posY, width, height, color)
end
function rl:DrawRectangleLinesEx(rec, lineThick, color)
  rl.lib.DrawRectangleLinesEx(rec, lineThick, color)
end
function rl:DrawRectangleRounded(rec, roundness, segments, color)
  rl.lib.DrawRectangleRounded(rec, roundness, segments, color)
end
function rl:DrawRectangleRoundedLines(rec, roundness, segments, lineThick, color)
  rl.lib.DrawRectangleRoundedLines(rec, roundness, segments, lineThick, color)
end
function rl:DrawTriangle(v1, v2, v3, color)
  rl.lib.DrawTriangle(v1, v2, v3, color)
end
function rl:DrawTriangleLines(v1, v2, v3, color)
  rl.lib.DrawTriangleLines(v1, v2, v3, color)
end
function rl:DrawTriangleFan(points, pointCount, color)
  rl.lib.DrawTriangleFan(points, pointCount, color)
end
function rl:DrawTriangleStrip(points, pointCount, color)
  rl.lib.DrawTriangleStrip(points, pointCount, color)
end
function rl:DrawPoly(center, sides, radius, rotation, color)
  rl.lib.DrawPoly(center, sides, radius, rotation, color)
end
function rl:DrawPolyLines(center, sides, radius, rotation, color)
  rl.lib.DrawPolyLines(center, sides, radius, rotation, color)
end
function rl:DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color)
  rl.lib.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color)
end
function rl:DrawSplineLinear(points, pointCount, thick, color)
  rl.lib.DrawSplineLinear(points, pointCount, thick, color)
end
function rl:DrawSplineBasis(points, pointCount, thick, color)
  rl.lib.DrawSplineBasis(points, pointCount, thick, color)
end
function rl:DrawSplineCatmullRom(points, pointCount, thick, color)
  rl.lib.DrawSplineCatmullRom(points, pointCount, thick, color)
end
function rl:DrawSplineBezierQuadratic(points, pointCount, thick, color)
  rl.lib.DrawSplineBezierQuadratic(points, pointCount, thick, color)
end
function rl:DrawSplineBezierCubic(points, pointCount, thick, color)
  rl.lib.DrawSplineBezierCubic(points, pointCount, thick, color)
end
function rl:DrawSplineSegmentLinear(p1, p2, thick, color)
  rl.lib.DrawSplineSegmentLinear(p1, p2, thick, color)
end
function rl:DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color)
  rl.lib.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color)
end
function rl:DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color)
  rl.lib.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color)
end
function rl:DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color)
  rl.lib.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color)
end
function rl:DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color)
  rl.lib.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color)
end
function rl:GetSplinePointLinear(startPos, endPos, t)
  return rl.lib.GetSplinePointLinear(startPos, endPos, t)
end
function rl:GetSplinePointBasis(p1, p2, p3, p4, t)
  return rl.lib.GetSplinePointBasis(p1, p2, p3, p4, t)
end
function rl:GetSplinePointCatmullRom(p1, p2, p3, p4, t)
  return rl.lib.GetSplinePointCatmullRom(p1, p2, p3, p4, t)
end
function rl:GetSplinePointBezierQuad(p1, c2, p3, t)
  return rl.lib.GetSplinePointBezierQuad(p1, c2, p3, t)
end
function rl:GetSplinePointBezierCubic(p1, c2, c3, p4, t)
  return rl.lib.GetSplinePointBezierCubic(p1, c2, c3, p4, t)
end
function rl:CheckCollisionRecs(rec1, rec2)
  return rl.lib.CheckCollisionRecs(rec1, rec2)
end
function rl:CheckCollisionCircles(center1, radius1, center2, radius2)
  return rl.lib.CheckCollisionCircles(center1, radius1, center2, radius2)
end
function rl:CheckCollisionCircleRec(center, radius, rec)
  return rl.lib.CheckCollisionCircleRec(center, radius, rec)
end
function rl:CheckCollisionPointRec(point, rec)
  return rl.lib.CheckCollisionPointRec(point, rec)
end
function rl:CheckCollisionPointCircle(point, center, radius)
  return rl.lib.CheckCollisionPointCircle(point, center, radius)
end
function rl:CheckCollisionPointTriangle(point, p1, p2, p3)
  return rl.lib.CheckCollisionPointTriangle(point, p1, p2, p3)
end
function rl:CheckCollisionPointPoly(point, points, pointCount)
  return rl.lib.CheckCollisionPointPoly(point, points, pointCount)
end
function rl:CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint)
  return rl.lib.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint)
end
function rl:CheckCollisionPointLine(point, p1, p2, threshold)
  return rl.lib.CheckCollisionPointLine(point, p1, p2, threshold)
end
function rl:GetCollisionRec(rec1, rec2)
  return rl.lib.GetCollisionRec(rec1, rec2)
end
function rl:LoadImage(fileName)
  return rl.lib.LoadImage(rl.char_ptr(fileName))
end
function rl:LoadImageRaw(fileName, width, height, format, headerSize)
  return rl.lib.LoadImageRaw(rl.char_ptr(fileName), width, height, format, headerSize)
end
function rl:LoadImageSvg(fileNameOrString, width, height)
  return rl.lib.LoadImageSvg(rl.char_ptr(fileNameOrString), width, height)
end
function rl:LoadImageAnim(fileName, frames)
  return rl.lib.LoadImageAnim(rl.char_ptr(fileName), frames)
end
function rl:LoadImageAnimFromMemory(fileType, fileData, dataSize, frames)
  return rl.lib.LoadImageAnimFromMemory(rl.char_ptr(fileType), fileData, dataSize, frames)
end
function rl:LoadImageFromMemory(fileType, fileData, dataSize)
  return rl.lib.LoadImageFromMemory(rl.char_ptr(fileType), fileData, dataSize)
end
function rl:LoadImageFromTexture(texture)
  return rl.lib.LoadImageFromTexture(texture)
end
function rl:LoadImageFromScreen()
  return rl.lib.LoadImageFromScreen()
end
function rl:IsImageReady(image)
  return rl.lib.IsImageReady(image)
end
function rl:UnloadImage(image)
  rl.lib.UnloadImage(image)
end
function rl:ExportImage(image, fileName)
  return rl.lib.ExportImage(image, rl.char_ptr(fileName))
end
function rl:ExportImageToMemory(image, fileType, fileSize)
  return rl.lib.ExportImageToMemory(image, rl.char_ptr(fileType), fileSize)
end
function rl:ExportImageAsCode(image, fileName)
  return rl.lib.ExportImageAsCode(image, rl.char_ptr(fileName))
end
function rl:GenImageColor(width, height, color)
  return rl.lib.GenImageColor(width, height, color)
end
function rl:GenImageGradientLinear(width, height, direction, start, name_)
  return rl.lib.GenImageGradientLinear(width, height, direction, start, name_)
end
function rl:GenImageGradientRadial(width, height, density, inner, outer)
  return rl.lib.GenImageGradientRadial(width, height, density, inner, outer)
end
function rl:GenImageGradientSquare(width, height, density, inner, outer)
  return rl.lib.GenImageGradientSquare(width, height, density, inner, outer)
end
function rl:GenImageChecked(width, height, checksX, checksY, col1, col2)
  return rl.lib.GenImageChecked(width, height, checksX, checksY, col1, col2)
end
function rl:GenImageWhiteNoise(width, height, factor)
  return rl.lib.GenImageWhiteNoise(width, height, factor)
end
function rl:GenImagePerlinNoise(width, height, offsetX, offsetY, scale)
  return rl.lib.GenImagePerlinNoise(width, height, offsetX, offsetY, scale)
end
function rl:GenImageCellular(width, height, tileSize)
  return rl.lib.GenImageCellular(width, height, tileSize)
end
function rl:GenImageText(width, height, text)
  return rl.lib.GenImageText(width, height, rl.char_ptr(text))
end
function rl:ImageCopy(image)
  return rl.lib.ImageCopy(image)
end
function rl:ImageFromImage(image, rec)
  return rl.lib.ImageFromImage(image, rec)
end
function rl:ImageText(text, fontSize, color)
  return rl.lib.ImageText(rl.char_ptr(text), fontSize, color)
end
function rl:ImageTextEx(font, text, fontSize, spacing, tint)
  return rl.lib.ImageTextEx(font, rl.char_ptr(text), fontSize, spacing, tint)
end
function rl:ImageFormat(image, newFormat)
  rl.lib.ImageFormat(image, newFormat)
end
function rl:ImageToPOT(image, fill)
  rl.lib.ImageToPOT(image, fill)
end
function rl:ImageCrop(image, crop)
  rl.lib.ImageCrop(image, crop)
end
function rl:ImageAlphaCrop(image, threshold)
  rl.lib.ImageAlphaCrop(image, threshold)
end
function rl:ImageAlphaClear(image, color, threshold)
  rl.lib.ImageAlphaClear(image, color, threshold)
end
function rl:ImageAlphaMask(image, alphaMask)
  rl.lib.ImageAlphaMask(image, alphaMask)
end
function rl:ImageAlphaPremultiply(image)
  rl.lib.ImageAlphaPremultiply(image)
end
function rl:ImageBlurGaussian(image, blurSize)
  rl.lib.ImageBlurGaussian(image, blurSize)
end
function rl:ImageKernelConvolution(image, kernel, kernelSize)
  rl.lib.ImageKernelConvolution(image, kernel, kernelSize)
end
function rl:ImageResize(image, newWidth, newHeight)
  rl.lib.ImageResize(image, newWidth, newHeight)
end
function rl:ImageResizeNN(image, newWidth, newHeight)
  rl.lib.ImageResizeNN(image, newWidth, newHeight)
end
function rl:ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill)
  rl.lib.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill)
end
function rl:ImageMipmaps(image)
  rl.lib.ImageMipmaps(image)
end
function rl:ImageDither(image, rBpp, gBpp, bBpp, aBpp)
  rl.lib.ImageDither(image, rBpp, gBpp, bBpp, aBpp)
end
function rl:ImageFlipVertical(image)
  rl.lib.ImageFlipVertical(image)
end
function rl:ImageFlipHorizontal(image)
  rl.lib.ImageFlipHorizontal(image)
end
function rl:ImageRotate(image, degrees)
  rl.lib.ImageRotate(image, degrees)
end
function rl:ImageRotateCW(image)
  rl.lib.ImageRotateCW(image)
end
function rl:ImageRotateCCW(image)
  rl.lib.ImageRotateCCW(image)
end
function rl:ImageColorTint(image, color)
  rl.lib.ImageColorTint(image, color)
end
function rl:ImageColorInvert(image)
  rl.lib.ImageColorInvert(image)
end
function rl:ImageColorGrayscale(image)
  rl.lib.ImageColorGrayscale(image)
end
function rl:ImageColorContrast(image, contrast)
  rl.lib.ImageColorContrast(image, contrast)
end
function rl:ImageColorBrightness(image, brightness)
  rl.lib.ImageColorBrightness(image, brightness)
end
function rl:ImageColorReplace(image, color, replace)
  rl.lib.ImageColorReplace(image, color, replace)
end
function rl:LoadImageColors(image)
  return rl.lib.LoadImageColors(image)
end
function rl:LoadImagePalette(image, maxPaletteSize, colorCount)
  return rl.lib.LoadImagePalette(image, maxPaletteSize, colorCount)
end
function rl:UnloadImageColors(colors)
  rl.lib.UnloadImageColors(colors)
end
function rl:UnloadImagePalette(colors)
  rl.lib.UnloadImagePalette(colors)
end
function rl:GetImageAlphaBorder(image, threshold)
  return rl.lib.GetImageAlphaBorder(image, threshold)
end
function rl:GetImageColor(image, x, y)
  return rl.lib.GetImageColor(image, x, y)
end
function rl:ImageClearBackground(dst, color)
  rl.lib.ImageClearBackground(dst, color)
end
function rl:ImageDrawPixel(dst, posX, posY, color)
  rl.lib.ImageDrawPixel(dst, posX, posY, color)
end
function rl:ImageDrawPixelV(dst, position, color)
  rl.lib.ImageDrawPixelV(dst, position, color)
end
function rl:ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color)
  rl.lib.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color)
end
function rl:ImageDrawLineV(dst, start, name_, color)
  rl.lib.ImageDrawLineV(dst, start, name_, color)
end
function rl:ImageDrawCircle(dst, centerX, centerY, radius, color)
  rl.lib.ImageDrawCircle(dst, centerX, centerY, radius, color)
end
function rl:ImageDrawCircleV(dst, center, radius, color)
  rl.lib.ImageDrawCircleV(dst, center, radius, color)
end
function rl:ImageDrawCircleLines(dst, centerX, centerY, radius, color)
  rl.lib.ImageDrawCircleLines(dst, centerX, centerY, radius, color)
end
function rl:ImageDrawCircleLinesV(dst, center, radius, color)
  rl.lib.ImageDrawCircleLinesV(dst, center, radius, color)
end
function rl:ImageDrawRectangle(dst, posX, posY, width, height, color)
  rl.lib.ImageDrawRectangle(dst, posX, posY, width, height, color)
end
function rl:ImageDrawRectangleV(dst, position, size, color)
  rl.lib.ImageDrawRectangleV(dst, position, size, color)
end
function rl:ImageDrawRectangleRec(dst, rec, color)
  rl.lib.ImageDrawRectangleRec(dst, rec, color)
end
function rl:ImageDrawRectangleLines(dst, rec, thick, color)
  rl.lib.ImageDrawRectangleLines(dst, rec, thick, color)
end
function rl:ImageDraw(dst, src, srcRec, dstRec, tint)
  rl.lib.ImageDraw(dst, src, srcRec, dstRec, tint)
end
function rl:ImageDrawText(dst, text, posX, posY, fontSize, color)
  rl.lib.ImageDrawText(dst, rl.char_ptr(text), posX, posY, fontSize, color)
end
function rl:ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint)
  rl.lib.ImageDrawTextEx(dst, font, rl.char_ptr(text), position, fontSize, spacing, tint)
end
function rl:LoadTexture(fileName)
  return rl.lib.LoadTexture(rl.char_ptr(fileName))
end
function rl:LoadTextureFromImage(image)
  return rl.lib.LoadTextureFromImage(image)
end
function rl:LoadTextureCubemap(image, layout)
  return rl.lib.LoadTextureCubemap(image, layout)
end
function rl:LoadRenderTexture(width, height)
  return rl.lib.LoadRenderTexture(width, height)
end
function rl:IsTextureReady(texture)
  return rl.lib.IsTextureReady(texture)
end
function rl:UnloadTexture(texture)
  rl.lib.UnloadTexture(texture)
end
function rl:IsRenderTextureReady(target)
  return rl.lib.IsRenderTextureReady(target)
end
function rl:UnloadRenderTexture(target)
  rl.lib.UnloadRenderTexture(target)
end
function rl:UpdateTexture(texture, pixels)
  rl.lib.UpdateTexture(texture, pixels)
end
function rl:UpdateTextureRec(texture, rec, pixels)
  rl.lib.UpdateTextureRec(texture, rec, pixels)
end
function rl:GenTextureMipmaps(texture)
  rl.lib.GenTextureMipmaps(texture)
end
function rl:SetTextureFilter(texture, filter)
  rl.lib.SetTextureFilter(texture, filter)
end
function rl:SetTextureWrap(texture, wrap)
  rl.lib.SetTextureWrap(texture, wrap)
end
function rl:DrawTexture(texture, posX, posY, tint)
  rl.lib.DrawTexture(texture, posX, posY, tint)
end
function rl:DrawTextureV(texture, position, tint)
  rl.lib.DrawTextureV(texture, position, tint)
end
function rl:DrawTextureEx(texture, position, rotation, scale, tint)
  rl.lib.DrawTextureEx(texture, position, rotation, scale, tint)
end
function rl:DrawTextureRec(texture, source, position, tint)
  rl.lib.DrawTextureRec(texture, source, position, tint)
end
function rl:DrawTexturePro(texture, source, dest, origin, rotation, tint)
  rl.lib.DrawTexturePro(texture, source, dest, origin, rotation, tint)
end
function rl:DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint)
  rl.lib.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint)
end
function rl:Fade(color, alpha)
  return rl.lib.Fade(color, alpha)
end
function rl:ColorToInt(color)
  return rl.lib.ColorToInt(color)
end
function rl:ColorNormalize(color)
  return rl.lib.ColorNormalize(color)
end
function rl:ColorFromNormalized(normalized)
  return rl.lib.ColorFromNormalized(normalized)
end
function rl:ColorToHSV(color)
  return rl.lib.ColorToHSV(color)
end
function rl:ColorFromHSV(hue, saturation, value)
  return rl.lib.ColorFromHSV(hue, saturation, value)
end
function rl:ColorTint(color, tint)
  return rl.lib.ColorTint(color, tint)
end
function rl:ColorBrightness(color, factor)
  return rl.lib.ColorBrightness(color, factor)
end
function rl:ColorContrast(color, contrast)
  return rl.lib.ColorContrast(color, contrast)
end
function rl:ColorAlpha(color, alpha)
  return rl.lib.ColorAlpha(color, alpha)
end
function rl:ColorAlphaBlend(dst, src, tint)
  return rl.lib.ColorAlphaBlend(dst, src, tint)
end
function rl:GetColor(hexValue)
  return rl.lib.GetColor(hexValue)
end
function rl:GetPixelColor(srcPtr, format)
  return rl.lib.GetPixelColor(srcPtr, format)
end
function rl:SetPixelColor(dstPtr, color, format)
  rl.lib.SetPixelColor(dstPtr, color, format)
end
function rl:GetPixelDataSize(width, height, format)
  return rl.lib.GetPixelDataSize(width, height, format)
end
function rl:GetFontDefault()
  return rl.lib.GetFontDefault()
end
function rl:LoadFont(fileName)
  return rl.lib.LoadFont(rl.char_ptr(fileName))
end
function rl:LoadFontEx(fileName, fontSize, codepoints, codepointCount)
  return rl.lib.LoadFontEx(rl.char_ptr(fileName), fontSize, codepoints, codepointCount)
end
function rl:LoadFontFromImage(image, key, firstChar)
  return rl.lib.LoadFontFromImage(image, key, firstChar)
end
function rl:LoadFontFromMemory(fileType, fileData, dataSize, fontSize, codepoints, codepointCount)
  return rl.lib.LoadFontFromMemory(rl.char_ptr(fileType), fileData, dataSize, fontSize, codepoints, codepointCount)
end
function rl:IsFontReady(font)
  return rl.lib.IsFontReady(font)
end
function rl:LoadFontData(fileData, dataSize, fontSize, codepoints, codepointCount, type)
  return rl.lib.LoadFontData(fileData, dataSize, fontSize, codepoints, codepointCount, type)
end
function rl:GenImageFontAtlas(glyphs, glyphRecs, glyphCount, fontSize, padding, packMethod)
  return rl.lib.GenImageFontAtlas(glyphs, glyphRecs, glyphCount, fontSize, padding, packMethod)
end
function rl:UnloadFontData(glyphs, glyphCount)
  rl.lib.UnloadFontData(glyphs, glyphCount)
end
function rl:UnloadFont(font)
  rl.lib.UnloadFont(font)
end
function rl:ExportFontAsCode(font, fileName)
  return rl.lib.ExportFontAsCode(font, rl.char_ptr(fileName))
end
function rl:DrawFPS(posX, posY)
  rl.lib.DrawFPS(posX, posY)
end
function rl:DrawText(text, posX, posY, fontSize, color)
  rl.lib.DrawText(rl.char_ptr(text), posX, posY, fontSize, color)
end
function rl:DrawTextEx(font, text, position, fontSize, spacing, tint)
  rl.lib.DrawTextEx(font, rl.char_ptr(text), position, fontSize, spacing, tint)
end
function rl:DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint)
  rl.lib.DrawTextPro(font, rl.char_ptr(text), position, origin, rotation, fontSize, spacing, tint)
end
function rl:DrawTextCodepoint(font, codepoint, position, fontSize, tint)
  rl.lib.DrawTextCodepoint(font, codepoint, position, fontSize, tint)
end
function rl:DrawTextCodepoints(font, codepoints, codepointCount, position, fontSize, spacing, tint)
  rl.lib.DrawTextCodepoints(font, codepoints, codepointCount, position, fontSize, spacing, tint)
end
function rl:SetTextLineSpacing(spacing)
  rl.lib.SetTextLineSpacing(spacing)
end
function rl:MeasureText(text, fontSize)
  return rl.lib.MeasureText(rl.char_ptr(text), fontSize)
end
function rl:MeasureTextEx(font, text, fontSize, spacing)
  return rl.lib.MeasureTextEx(font, rl.char_ptr(text), fontSize, spacing)
end
function rl:GetGlyphIndex(font, codepoint)
  return rl.lib.GetGlyphIndex(font, codepoint)
end
function rl:GetGlyphInfo(font, codepoint)
  return rl.lib.GetGlyphInfo(font, codepoint)
end
function rl:GetGlyphAtlasRec(font, codepoint)
  return rl.lib.GetGlyphAtlasRec(font, codepoint)
end
function rl:LoadUTF8(codepoints, length)
  return ffi.string(rl.lib.LoadUTF8(codepoints, length))
end
function rl:UnloadUTF8(text)
  rl.lib.UnloadUTF8(rl.char_ptr(text))
end
function rl:LoadCodepoints(text, count)
  return rl.lib.LoadCodepoints(rl.char_ptr(text), count)
end
function rl:UnloadCodepoints(codepoints)
  rl.lib.UnloadCodepoints(codepoints)
end
function rl:GetCodepointCount(text)
  return rl.lib.GetCodepointCount(rl.char_ptr(text))
end
function rl:GetCodepoint(text, codepointSize)
  return rl.lib.GetCodepoint(rl.char_ptr(text), codepointSize)
end
function rl:GetCodepointNext(text, codepointSize)
  return rl.lib.GetCodepointNext(rl.char_ptr(text), codepointSize)
end
function rl:GetCodepointPrevious(text, codepointSize)
  return rl.lib.GetCodepointPrevious(rl.char_ptr(text), codepointSize)
end
function rl:CodepointToUTF8(codepoint, utf8Size)
  return ffi.string(rl.lib.CodepointToUTF8(codepoint, utf8Size))
end
function rl:TextCopy(dst, src)
  return rl.lib.TextCopy(rl.char_ptr(dst), rl.char_ptr(src))
end
function rl:TextIsEqual(text1, text2)
  return rl.lib.TextIsEqual(rl.char_ptr(text1), rl.char_ptr(text2))
end
function rl:TextLength(text)
  return rl.lib.TextLength(rl.char_ptr(text))
end
function rl:TextFormat(text, args)
  return ffi.string(rl.lib.TextFormat(rl.char_ptr(text), args))
end
function rl:TextSubtext(text, position, length)
  return ffi.string(rl.lib.TextSubtext(rl.char_ptr(text), position, length))
end
function rl:TextReplace(text, replace, by)
  return ffi.string(rl.lib.TextReplace(rl.char_ptr(text), rl.char_ptr(replace), rl.char_ptr(by)))
end
function rl:TextInsert(text, insert, position)
  return ffi.string(rl.lib.TextInsert(rl.char_ptr(text), rl.char_ptr(insert), position))
end
function rl:TextJoin(textList, count, delimiter)
  return ffi.string(rl.lib.TextJoin(textList, count, rl.char_ptr(delimiter)))
end
function rl:TextSplit(text, delimiter, count)
  return rl.lib.TextSplit(rl.char_ptr(text), delimiter, count)
end
function rl:TextAppend(text, append, position)
  rl.lib.TextAppend(rl.char_ptr(text), rl.char_ptr(append), position)
end
function rl:TextFindIndex(text, find)
  return rl.lib.TextFindIndex(rl.char_ptr(text), rl.char_ptr(find))
end
function rl:TextToUpper(text)
  return ffi.string(rl.lib.TextToUpper(rl.char_ptr(text)))
end
function rl:TextToLower(text)
  return ffi.string(rl.lib.TextToLower(rl.char_ptr(text)))
end
function rl:TextToPascal(text)
  return ffi.string(rl.lib.TextToPascal(rl.char_ptr(text)))
end
function rl:TextToInteger(text)
  return rl.lib.TextToInteger(rl.char_ptr(text))
end
function rl:TextToFloat(text)
  return rl.lib.TextToFloat(rl.char_ptr(text))
end
function rl:DrawLine3D(startPos, endPos, color)
  rl.lib.DrawLine3D(startPos, endPos, color)
end
function rl:DrawPoint3D(position, color)
  rl.lib.DrawPoint3D(position, color)
end
function rl:DrawCircle3D(center, radius, rotationAxis, rotationAngle, color)
  rl.lib.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color)
end
function rl:DrawTriangle3D(v1, v2, v3, color)
  rl.lib.DrawTriangle3D(v1, v2, v3, color)
end
function rl:DrawTriangleStrip3D(points, pointCount, color)
  rl.lib.DrawTriangleStrip3D(points, pointCount, color)
end
function rl:DrawCube(position, width, height, length, color)
  rl.lib.DrawCube(position, width, height, length, color)
end
function rl:DrawCubeV(position, size, color)
  rl.lib.DrawCubeV(position, size, color)
end
function rl:DrawCubeWires(position, width, height, length, color)
  rl.lib.DrawCubeWires(position, width, height, length, color)
end
function rl:DrawCubeWiresV(position, size, color)
  rl.lib.DrawCubeWiresV(position, size, color)
end
function rl:DrawSphere(centerPos, radius, color)
  rl.lib.DrawSphere(centerPos, radius, color)
end
function rl:DrawSphereEx(centerPos, radius, rings, slices, color)
  rl.lib.DrawSphereEx(centerPos, radius, rings, slices, color)
end
function rl:DrawSphereWires(centerPos, radius, rings, slices, color)
  rl.lib.DrawSphereWires(centerPos, radius, rings, slices, color)
end
function rl:DrawCylinder(position, radiusTop, radiusBottom, height, slices, color)
  rl.lib.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color)
end
function rl:DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color)
  rl.lib.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color)
end
function rl:DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color)
  rl.lib.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color)
end
function rl:DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color)
  rl.lib.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color)
end
function rl:DrawCapsule(startPos, endPos, radius, slices, rings, color)
  rl.lib.DrawCapsule(startPos, endPos, radius, slices, rings, color)
end
function rl:DrawCapsuleWires(startPos, endPos, radius, slices, rings, color)
  rl.lib.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color)
end
function rl:DrawPlane(centerPos, size, color)
  rl.lib.DrawPlane(centerPos, size, color)
end
function rl:DrawRay(ray, color)
  rl.lib.DrawRay(ray, color)
end
function rl:DrawGrid(slices, spacing)
  rl.lib.DrawGrid(slices, spacing)
end
function rl:LoadModel(fileName)
  return rl.lib.LoadModel(rl.char_ptr(fileName))
end
function rl:LoadModelFromMesh(mesh)
  return rl.lib.LoadModelFromMesh(mesh)
end
function rl:IsModelReady(model)
  return rl.lib.IsModelReady(model)
end
function rl:UnloadModel(model)
  rl.lib.UnloadModel(model)
end
function rl:GetModelBoundingBox(model)
  return rl.lib.GetModelBoundingBox(model)
end
function rl:DrawModel(model, position, scale, tint)
  rl.lib.DrawModel(model, position, scale, tint)
end
function rl:DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint)
  rl.lib.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint)
end
function rl:DrawModelWires(model, position, scale, tint)
  rl.lib.DrawModelWires(model, position, scale, tint)
end
function rl:DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint)
  rl.lib.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint)
end
function rl:DrawBoundingBox(box, color)
  rl.lib.DrawBoundingBox(box, color)
end
function rl:DrawBillboard(camera, texture, position, size, tint)
  rl.lib.DrawBillboard(camera, texture, position, size, tint)
end
function rl:DrawBillboardRec(camera, texture, source, position, size, tint)
  rl.lib.DrawBillboardRec(camera, texture, source, position, size, tint)
end
function rl:DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint)
  rl.lib.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint)
end
function rl:UploadMesh(mesh, dynamic)
  rl.lib.UploadMesh(mesh, dynamic)
end
function rl:UpdateMeshBuffer(mesh, index, data, dataSize, offset)
  rl.lib.UpdateMeshBuffer(mesh, index, data, dataSize, offset)
end
function rl:UnloadMesh(mesh)
  rl.lib.UnloadMesh(mesh)
end
function rl:DrawMesh(mesh, material, transform)
  rl.lib.DrawMesh(mesh, material, transform)
end
function rl:DrawMeshInstanced(mesh, material, transforms, instances)
  rl.lib.DrawMeshInstanced(mesh, material, transforms, instances)
end
function rl:GetMeshBoundingBox(mesh)
  return rl.lib.GetMeshBoundingBox(mesh)
end
function rl:GenMeshTangents(mesh)
  rl.lib.GenMeshTangents(mesh)
end
function rl:ExportMesh(mesh, fileName)
  return rl.lib.ExportMesh(mesh, rl.char_ptr(fileName))
end
function rl:ExportMeshAsCode(mesh, fileName)
  return rl.lib.ExportMeshAsCode(mesh, rl.char_ptr(fileName))
end
function rl:GenMeshPoly(sides, radius)
  return rl.lib.GenMeshPoly(sides, radius)
end
function rl:GenMeshPlane(width, length, resX, resZ)
  return rl.lib.GenMeshPlane(width, length, resX, resZ)
end
function rl:GenMeshCube(width, height, length)
  return rl.lib.GenMeshCube(width, height, length)
end
function rl:GenMeshSphere(radius, rings, slices)
  return rl.lib.GenMeshSphere(radius, rings, slices)
end
function rl:GenMeshHemiSphere(radius, rings, slices)
  return rl.lib.GenMeshHemiSphere(radius, rings, slices)
end
function rl:GenMeshCylinder(radius, height, slices)
  return rl.lib.GenMeshCylinder(radius, height, slices)
end
function rl:GenMeshCone(radius, height, slices)
  return rl.lib.GenMeshCone(radius, height, slices)
end
function rl:GenMeshTorus(radius, size, radSeg, sides)
  return rl.lib.GenMeshTorus(radius, size, radSeg, sides)
end
function rl:GenMeshKnot(radius, size, radSeg, sides)
  return rl.lib.GenMeshKnot(radius, size, radSeg, sides)
end
function rl:GenMeshHeightmap(heightmap, size)
  return rl.lib.GenMeshHeightmap(heightmap, size)
end
function rl:GenMeshCubicmap(cubicmap, cubeSize)
  return rl.lib.GenMeshCubicmap(cubicmap, cubeSize)
end
function rl:LoadMaterials(fileName, materialCount)
  return rl.lib.LoadMaterials(rl.char_ptr(fileName), materialCount)
end
function rl:LoadMaterialDefault()
  return rl.lib.LoadMaterialDefault()
end
function rl:IsMaterialReady(material)
  return rl.lib.IsMaterialReady(material)
end
function rl:UnloadMaterial(material)
  rl.lib.UnloadMaterial(material)
end
function rl:SetMaterialTexture(material, mapType, texture)
  rl.lib.SetMaterialTexture(material, mapType, texture)
end
function rl:SetModelMeshMaterial(model, meshId, materialId)
  rl.lib.SetModelMeshMaterial(model, meshId, materialId)
end
function rl:LoadModelAnimations(fileName, animCount)
  return rl.lib.LoadModelAnimations(rl.char_ptr(fileName), animCount)
end
function rl:UpdateModelAnimation(model, anim, frame)
  rl.lib.UpdateModelAnimation(model, anim, frame)
end
function rl:UnloadModelAnimation(anim)
  rl.lib.UnloadModelAnimation(anim)
end
function rl:UnloadModelAnimations(animations, animCount)
  rl.lib.UnloadModelAnimations(animations, animCount)
end
function rl:IsModelAnimationValid(model, anim)
  return rl.lib.IsModelAnimationValid(model, anim)
end
function rl:CheckCollisionSpheres(center1, radius1, center2, radius2)
  return rl.lib.CheckCollisionSpheres(center1, radius1, center2, radius2)
end
function rl:CheckCollisionBoxes(box1, box2)
  return rl.lib.CheckCollisionBoxes(box1, box2)
end
function rl:CheckCollisionBoxSphere(box, center, radius)
  return rl.lib.CheckCollisionBoxSphere(box, center, radius)
end
function rl:GetRayCollisionSphere(ray, center, radius)
  return rl.lib.GetRayCollisionSphere(ray, center, radius)
end
function rl:GetRayCollisionBox(ray, box)
  return rl.lib.GetRayCollisionBox(ray, box)
end
function rl:GetRayCollisionMesh(ray, mesh, transform)
  return rl.lib.GetRayCollisionMesh(ray, mesh, transform)
end
function rl:GetRayCollisionTriangle(ray, p1, p2, p3)
  return rl.lib.GetRayCollisionTriangle(ray, p1, p2, p3)
end
function rl:GetRayCollisionQuad(ray, p1, p2, p3, p4)
  return rl.lib.GetRayCollisionQuad(ray, p1, p2, p3, p4)
end
function rl:InitAudioDevice()
  rl.lib.InitAudioDevice()
end
function rl:CloseAudioDevice()
  rl.lib.CloseAudioDevice()
end
function rl:IsAudioDeviceReady()
  return rl.lib.IsAudioDeviceReady()
end
function rl:SetMasterVolume(volume)
  rl.lib.SetMasterVolume(volume)
end
function rl:GetMasterVolume()
  return rl.lib.GetMasterVolume()
end
function rl:LoadWave(fileName)
  return rl.lib.LoadWave(rl.char_ptr(fileName))
end
function rl:LoadWaveFromMemory(fileType, fileData, dataSize)
  return rl.lib.LoadWaveFromMemory(rl.char_ptr(fileType), fileData, dataSize)
end
function rl:IsWaveReady(wave)
  return rl.lib.IsWaveReady(wave)
end
function rl:UnloadWave(wave)
  rl.lib.UnloadWave(wave)
end
function rl:ExportWave(wave, fileName)
  return rl.lib.ExportWave(wave, rl.char_ptr(fileName))
end
function rl:ExportWaveAsCode(wave, fileName)
  return rl.lib.ExportWaveAsCode(wave, rl.char_ptr(fileName))
end
function rl:WaveCopy(wave)
  return rl.lib.WaveCopy(wave)
end
function rl:WaveCrop(wave, initSample, finalSample)
  rl.lib.WaveCrop(wave, initSample, finalSample)
end
function rl:WaveFormat(wave, sampleRate, sampleSize, channels)
  rl.lib.WaveFormat(wave, sampleRate, sampleSize, channels)
end
function rl:LoadWaveSamples(wave)
  return rl.lib.LoadWaveSamples(wave)
end
function rl:UnloadWaveSamples(samples)
  rl.lib.UnloadWaveSamples(samples)
end
function rl:LoadMusicStream(fileName)
  return rl.lib.LoadMusicStream(rl.char_ptr(fileName))
end
function rl:LoadMusicStreamFromMemory(fileType, data, dataSize)
  return rl.lib.LoadMusicStreamFromMemory(rl.char_ptr(fileType), data, dataSize)
end
function rl:IsMusicReady(music)
  return rl.lib.IsMusicReady(music)
end
function rl:UnloadMusicStream(music)
  rl.lib.UnloadMusicStream(music)
end
function rl:PlayMusicStream(music)
  rl.lib.PlayMusicStream(music)
end
function rl:IsMusicStreamPlaying(music)
  return rl.lib.IsMusicStreamPlaying(music)
end
function rl:UpdateMusicStream(music)
  rl.lib.UpdateMusicStream(music)
end
function rl:StopMusicStream(music)
  rl.lib.StopMusicStream(music)
end
function rl:PauseMusicStream(music)
  rl.lib.PauseMusicStream(music)
end
function rl:ResumeMusicStream(music)
  rl.lib.ResumeMusicStream(music)
end
function rl:SeekMusicStream(music, position)
  rl.lib.SeekMusicStream(music, position)
end
function rl:SetMusicVolume(music, volume)
  rl.lib.SetMusicVolume(music, volume)
end
function rl:SetMusicPitch(music, pitch)
  rl.lib.SetMusicPitch(music, pitch)
end
function rl:SetMusicPan(music, pan)
  rl.lib.SetMusicPan(music, pan)
end
function rl:GetMusicTimeLength(music)
  return rl.lib.GetMusicTimeLength(music)
end
function rl:GetMusicTimePlayed(music)
  return rl.lib.GetMusicTimePlayed(music)
end
function rl:LoadAudioStream(sampleRate, sampleSize, channels)
  return rl.lib.LoadAudioStream(sampleRate, sampleSize, channels)
end
function rl:IsAudioStreamReady(stream)
  return rl.lib.IsAudioStreamReady(stream)
end
function rl:UnloadAudioStream(stream)
  rl.lib.UnloadAudioStream(stream)
end
function rl:UpdateAudioStream(stream, data, frameCount)
  rl.lib.UpdateAudioStream(stream, data, frameCount)
end
function rl:IsAudioStreamProcessed(stream)
  return rl.lib.IsAudioStreamProcessed(stream)
end
function rl:PlayAudioStream(stream)
  rl.lib.PlayAudioStream(stream)
end
function rl:PauseAudioStream(stream)
  rl.lib.PauseAudioStream(stream)
end
function rl:ResumeAudioStream(stream)
  rl.lib.ResumeAudioStream(stream)
end
function rl:IsAudioStreamPlaying(stream)
  return rl.lib.IsAudioStreamPlaying(stream)
end
function rl:StopAudioStream(stream)
  rl.lib.StopAudioStream(stream)
end
function rl:SetAudioStreamVolume(stream, volume)
  rl.lib.SetAudioStreamVolume(stream, volume)
end
function rl:SetAudioStreamPitch(stream, pitch)
  rl.lib.SetAudioStreamPitch(stream, pitch)
end
function rl:SetAudioStreamPan(stream, pan)
  rl.lib.SetAudioStreamPan(stream, pan)
end
function rl:SetAudioStreamBufferSizeDefault(size)
  rl.lib.SetAudioStreamBufferSizeDefault(size)
end
function rl:Clamp(value, min, max)
  return rl.lib.Clamp(value, min, max)
end
function rl:Lerp(start, name_, amount)
  return rl.lib.Lerp(start, name_, amount)
end
function rl:Normalize(value, start, name_)
  return rl.lib.Normalize(value, start, name_)
end
function rl:Remap(value, inputStart, inputEnd, outputStart, outputEnd)
  return rl.lib.Remap(value, inputStart, inputEnd, outputStart, outputEnd)
end
function rl:Wrap(value, min, max)
  return rl.lib.Wrap(value, min, max)
end
function rl:FloatEquals(x, y)
  return rl.lib.FloatEquals(x, y)
end
function rl:Vector2Zero()
  return rl.lib.Vector2Zero()
end
function rl:Vector2One()
  return rl.lib.Vector2One()
end
function rl:Vector2Add(v1, v2)
  return rl.lib.Vector2Add(v1, v2)
end
function rl:Vector2AddValue(v, add)
  return rl.lib.Vector2AddValue(v, add)
end
function rl:Vector2Subtract(v1, v2)
  return rl.lib.Vector2Subtract(v1, v2)
end
function rl:Vector2SubtractValue(v, sub)
  return rl.lib.Vector2SubtractValue(v, sub)
end
function rl:Vector2Length(v)
  return rl.lib.Vector2Length(v)
end
function rl:Vector2LengthSqr(v)
  return rl.lib.Vector2LengthSqr(v)
end
function rl:Vector2DotProduct(v1, v2)
  return rl.lib.Vector2DotProduct(v1, v2)
end
function rl:Vector2Distance(v1, v2)
  return rl.lib.Vector2Distance(v1, v2)
end
function rl:Vector2DistanceSqr(v1, v2)
  return rl.lib.Vector2DistanceSqr(v1, v2)
end
function rl:Vector2Angle(v1, v2)
  return rl.lib.Vector2Angle(v1, v2)
end
function rl:Vector2LineAngle(start, name_)
  return rl.lib.Vector2LineAngle(start, name_)
end
function rl:Vector2Scale(v, scale)
  return rl.lib.Vector2Scale(v, scale)
end
function rl:Vector2Multiply(v1, v2)
  return rl.lib.Vector2Multiply(v1, v2)
end
function rl:Vector2Negate(v)
  return rl.lib.Vector2Negate(v)
end
function rl:Vector2Divide(v1, v2)
  return rl.lib.Vector2Divide(v1, v2)
end
function rl:Vector2Normalize(v)
  return rl.lib.Vector2Normalize(v)
end
function rl:Vector2Transform(v, mat)
  return rl.lib.Vector2Transform(v, mat)
end
function rl:Vector2Lerp(v1, v2, amount)
  return rl.lib.Vector2Lerp(v1, v2, amount)
end
function rl:Vector2Reflect(v, normal)
  return rl.lib.Vector2Reflect(v, normal)
end
function rl:Vector2Rotate(v, angle)
  return rl.lib.Vector2Rotate(v, angle)
end
function rl:Vector2MoveTowards(v, target, maxDistance)
  return rl.lib.Vector2MoveTowards(v, target, maxDistance)
end
function rl:Vector2Invert(v)
  return rl.lib.Vector2Invert(v)
end
function rl:Vector2Clamp(v, min, max)
  return rl.lib.Vector2Clamp(v, min, max)
end
function rl:Vector2ClampValue(v, min, max)
  return rl.lib.Vector2ClampValue(v, min, max)
end
function rl:Vector2Equals(p, q)
  return rl.lib.Vector2Equals(p, q)
end
function rl:Vector3Zero()
  return rl.lib.Vector3Zero()
end
function rl:Vector3One()
  return rl.lib.Vector3One()
end
function rl:Vector3Add(v1, v2)
  return rl.lib.Vector3Add(v1, v2)
end
function rl:Vector3AddValue(v, add)
  return rl.lib.Vector3AddValue(v, add)
end
function rl:Vector3Subtract(v1, v2)
  return rl.lib.Vector3Subtract(v1, v2)
end
function rl:Vector3SubtractValue(v, sub)
  return rl.lib.Vector3SubtractValue(v, sub)
end
function rl:Vector3Scale(v, scalar)
  return rl.lib.Vector3Scale(v, scalar)
end
function rl:Vector3Multiply(v1, v2)
  return rl.lib.Vector3Multiply(v1, v2)
end
function rl:Vector3CrossProduct(v1, v2)
  return rl.lib.Vector3CrossProduct(v1, v2)
end
function rl:Vector3Perpendicular(v)
  return rl.lib.Vector3Perpendicular(v)
end
function rl:Vector3Length(v)
  return rl.lib.Vector3Length(v)
end
function rl:Vector3LengthSqr(v)
  return rl.lib.Vector3LengthSqr(v)
end
function rl:Vector3DotProduct(v1, v2)
  return rl.lib.Vector3DotProduct(v1, v2)
end
function rl:Vector3Distance(v1, v2)
  return rl.lib.Vector3Distance(v1, v2)
end
function rl:Vector3DistanceSqr(v1, v2)
  return rl.lib.Vector3DistanceSqr(v1, v2)
end
function rl:Vector3Angle(v1, v2)
  return rl.lib.Vector3Angle(v1, v2)
end
function rl:Vector3Negate(v)
  return rl.lib.Vector3Negate(v)
end
function rl:Vector3Divide(v1, v2)
  return rl.lib.Vector3Divide(v1, v2)
end
function rl:Vector3Normalize(v)
  return rl.lib.Vector3Normalize(v)
end
function rl:Vector3Project(v1, v2)
  return rl.lib.Vector3Project(v1, v2)
end
function rl:Vector3Reject(v1, v2)
  return rl.lib.Vector3Reject(v1, v2)
end
function rl:Vector3OrthoNormalize(v1, v2)
  rl.lib.Vector3OrthoNormalize(v1, v2)
end
function rl:Vector3Transform(v, mat)
  return rl.lib.Vector3Transform(v, mat)
end
function rl:Vector3RotateByQuaternion(v, q)
  return rl.lib.Vector3RotateByQuaternion(v, q)
end
function rl:Vector3RotateByAxisAngle(v, axis, angle)
  return rl.lib.Vector3RotateByAxisAngle(v, axis, angle)
end
function rl:Vector3Lerp(v1, v2, amount)
  return rl.lib.Vector3Lerp(v1, v2, amount)
end
function rl:Vector3Reflect(v, normal)
  return rl.lib.Vector3Reflect(v, normal)
end
function rl:Vector3Min(v1, v2)
  return rl.lib.Vector3Min(v1, v2)
end
function rl:Vector3Max(v1, v2)
  return rl.lib.Vector3Max(v1, v2)
end
function rl:Vector3Barycenter(p, a, b, c)
  return rl.lib.Vector3Barycenter(p, a, b, c)
end
function rl:Vector3Unproject(source, projection, view)
  return rl.lib.Vector3Unproject(source, projection, view)
end
function rl:Vector3ToFloatV(v)
  return rl.lib.Vector3ToFloatV(v)
end
function rl:Vector3Invert(v)
  return rl.lib.Vector3Invert(v)
end
function rl:Vector3Clamp(v, min, max)
  return rl.lib.Vector3Clamp(v, min, max)
end
function rl:Vector3ClampValue(v, min, max)
  return rl.lib.Vector3ClampValue(v, min, max)
end
function rl:Vector3Equals(p, q)
  return rl.lib.Vector3Equals(p, q)
end
function rl:Vector3Refract(v, n, r)
  return rl.lib.Vector3Refract(v, n, r)
end
function rl:MatrixDeterminant(mat)
  return rl.lib.MatrixDeterminant(mat)
end
function rl:MatrixTrace(mat)
  return rl.lib.MatrixTrace(mat)
end
function rl:MatrixTranspose(mat)
  return rl.lib.MatrixTranspose(mat)
end
function rl:MatrixInvert(mat)
  return rl.lib.MatrixInvert(mat)
end
function rl:MatrixIdentity()
  return rl.lib.MatrixIdentity()
end
function rl:MatrixAdd(left, right)
  return rl.lib.MatrixAdd(left, right)
end
function rl:MatrixSubtract(left, right)
  return rl.lib.MatrixSubtract(left, right)
end
function rl:MatrixMultiply(left, right)
  return rl.lib.MatrixMultiply(left, right)
end
function rl:MatrixTranslate(x, y, z)
  return rl.lib.MatrixTranslate(x, y, z)
end
function rl:MatrixRotate(axis, angle)
  return rl.lib.MatrixRotate(axis, angle)
end
function rl:MatrixRotateX(angle)
  return rl.lib.MatrixRotateX(angle)
end
function rl:MatrixRotateY(angle)
  return rl.lib.MatrixRotateY(angle)
end
function rl:MatrixRotateZ(angle)
  return rl.lib.MatrixRotateZ(angle)
end
function rl:MatrixRotateXYZ(angle)
  return rl.lib.MatrixRotateXYZ(angle)
end
function rl:MatrixRotateZYX(angle)
  return rl.lib.MatrixRotateZYX(angle)
end
function rl:MatrixScale(x, y, z)
  return rl.lib.MatrixScale(x, y, z)
end
function rl:MatrixFrustum(left, right, bottom, top, near, far)
  return rl.lib.MatrixFrustum(left, right, bottom, top, near, far)
end
function rl:MatrixPerspective(fovY, aspect, nearPlane, farPlane)
  return rl.lib.MatrixPerspective(fovY, aspect, nearPlane, farPlane)
end
function rl:MatrixOrtho(left, right, bottom, top, nearPlane, farPlane)
  return rl.lib.MatrixOrtho(left, right, bottom, top, nearPlane, farPlane)
end
function rl:MatrixLookAt(eye, target, up)
  return rl.lib.MatrixLookAt(eye, target, up)
end
function rl:MatrixToFloatV(mat)
  return rl.lib.MatrixToFloatV(mat)
end
function rl:QuaternionAdd(q1, q2)
  return rl.lib.QuaternionAdd(q1, q2)
end
function rl:QuaternionAddValue(q, add)
  return rl.lib.QuaternionAddValue(q, add)
end
function rl:QuaternionSubtract(q1, q2)
  return rl.lib.QuaternionSubtract(q1, q2)
end
function rl:QuaternionSubtractValue(q, sub)
  return rl.lib.QuaternionSubtractValue(q, sub)
end
function rl:QuaternionIdentity()
  return rl.lib.QuaternionIdentity()
end
function rl:QuaternionLength(q)
  return rl.lib.QuaternionLength(q)
end
function rl:QuaternionNormalize(q)
  return rl.lib.QuaternionNormalize(q)
end
function rl:QuaternionInvert(q)
  return rl.lib.QuaternionInvert(q)
end
function rl:QuaternionMultiply(q1, q2)
  return rl.lib.QuaternionMultiply(q1, q2)
end
function rl:QuaternionScale(q, mul)
  return rl.lib.QuaternionScale(q, mul)
end
function rl:QuaternionDivide(q1, q2)
  return rl.lib.QuaternionDivide(q1, q2)
end
function rl:QuaternionLerp(q1, q2, amount)
  return rl.lib.QuaternionLerp(q1, q2, amount)
end
function rl:QuaternionNlerp(q1, q2, amount)
  return rl.lib.QuaternionNlerp(q1, q2, amount)
end
function rl:QuaternionSlerp(q1, q2, amount)
  return rl.lib.QuaternionSlerp(q1, q2, amount)
end
function rl:QuaternionFromVector3ToVector3(from, to)
  return rl.lib.QuaternionFromVector3ToVector3(from, to)
end
function rl:QuaternionFromMatrix(mat)
  return rl.lib.QuaternionFromMatrix(mat)
end
function rl:QuaternionToMatrix(q)
  return rl.lib.QuaternionToMatrix(q)
end
function rl:QuaternionFromAxisAngle(axis, angle)
  return rl.lib.QuaternionFromAxisAngle(axis, angle)
end
function rl:QuaternionToAxisAngle(q, outAxis, outAngle)
  rl.lib.QuaternionToAxisAngle(q, outAxis, outAngle)
end
function rl:QuaternionFromEuler(pitch, yaw, roll)
  return rl.lib.QuaternionFromEuler(pitch, yaw, roll)
end
function rl:QuaternionToEuler(q)
  return rl.lib.QuaternionToEuler(q)
end
function rl:QuaternionTransform(q, mat)
  return rl.lib.QuaternionTransform(q, mat)
end
function rl:QuaternionEquals(p, q)
  return rl.lib.QuaternionEquals(p, q)
end
function rl:rlMatrixMode(mode)
  rl.lib.rlMatrixMode(mode)
end
function rl:rlPushMatrix()
  rl.lib.rlPushMatrix()
end
function rl:rlPopMatrix()
  rl.lib.rlPopMatrix()
end
function rl:rlLoadIdentity()
  rl.lib.rlLoadIdentity()
end
function rl:rlTranslatef(x, y, z)
  rl.lib.rlTranslatef(x, y, z)
end
function rl:rlRotatef(angle, x, y, z)
  rl.lib.rlRotatef(angle, x, y, z)
end
function rl:rlScalef(x, y, z)
  rl.lib.rlScalef(x, y, z)
end
function rl:rlMultMatrixf(matf)
  rl.lib.rlMultMatrixf(matf)
end
function rl:rlFrustum(left, right, bottom, top, znear, zfar)
  rl.lib.rlFrustum(left, right, bottom, top, znear, zfar)
end
function rl:rlOrtho(left, right, bottom, top, znear, zfar)
  rl.lib.rlOrtho(left, right, bottom, top, znear, zfar)
end
function rl:rlViewport(x, y, width, height)
  rl.lib.rlViewport(x, y, width, height)
end
function rl:rlBegin(mode)
  rl.lib.rlBegin(mode)
end
function rl:rlEnd()
  rl.lib.rlEnd()
end
function rl:rlVertex2i(x, y)
  rl.lib.rlVertex2i(x, y)
end
function rl:rlVertex2f(x, y)
  rl.lib.rlVertex2f(x, y)
end
function rl:rlVertex3f(x, y, z)
  rl.lib.rlVertex3f(x, y, z)
end
function rl:rlTexCoord2f(x, y)
  rl.lib.rlTexCoord2f(x, y)
end
function rl:rlNormal3f(x, y, z)
  rl.lib.rlNormal3f(x, y, z)
end
function rl:rlColor4ub(r, g, b, a)
  rl.lib.rlColor4ub(r, g, b, a)
end
function rl:rlColor3f(x, y, z)
  rl.lib.rlColor3f(x, y, z)
end
function rl:rlColor4f(x, y, z, w)
  rl.lib.rlColor4f(x, y, z, w)
end
function rl:rlEnableVertexArray(vaoId)
  return rl.lib.rlEnableVertexArray(vaoId)
end
function rl:rlDisableVertexArray()
  rl.lib.rlDisableVertexArray()
end
function rl:rlEnableVertexBuffer(id)
  rl.lib.rlEnableVertexBuffer(id)
end
function rl:rlDisableVertexBuffer()
  rl.lib.rlDisableVertexBuffer()
end
function rl:rlEnableVertexBufferElement(id)
  rl.lib.rlEnableVertexBufferElement(id)
end
function rl:rlDisableVertexBufferElement()
  rl.lib.rlDisableVertexBufferElement()
end
function rl:rlEnableVertexAttribute(index)
  rl.lib.rlEnableVertexAttribute(index)
end
function rl:rlDisableVertexAttribute(index)
  rl.lib.rlDisableVertexAttribute(index)
end
function rl:rlActiveTextureSlot(slot)
  rl.lib.rlActiveTextureSlot(slot)
end
function rl:rlEnableTexture(id)
  rl.lib.rlEnableTexture(id)
end
function rl:rlDisableTexture()
  rl.lib.rlDisableTexture()
end
function rl:rlEnableTextureCubemap(id)
  rl.lib.rlEnableTextureCubemap(id)
end
function rl:rlDisableTextureCubemap()
  rl.lib.rlDisableTextureCubemap()
end
function rl:rlTextureParameters(id, param, value)
  rl.lib.rlTextureParameters(id, param, value)
end
function rl:rlCubemapParameters(id, param, value)
  rl.lib.rlCubemapParameters(id, param, value)
end
function rl:rlEnableShader(id)
  rl.lib.rlEnableShader(id)
end
function rl:rlDisableShader()
  rl.lib.rlDisableShader()
end
function rl:rlEnableFramebuffer(id)
  rl.lib.rlEnableFramebuffer(id)
end
function rl:rlDisableFramebuffer()
  rl.lib.rlDisableFramebuffer()
end
function rl:rlActiveDrawBuffers(count)
  rl.lib.rlActiveDrawBuffers(count)
end
function rl:rlBlitFramebuffer(srcX, srcY, srcWidth, srcHeight, dstX, dstY, dstWidth, dstHeight, bufferMask)
  rl.lib.rlBlitFramebuffer(srcX, srcY, srcWidth, srcHeight, dstX, dstY, dstWidth, dstHeight, bufferMask)
end
function rl:rlBindFramebuffer(target, framebuffer)
  rl.lib.rlBindFramebuffer(target, framebuffer)
end
function rl:rlEnableColorBlend()
  rl.lib.rlEnableColorBlend()
end
function rl:rlDisableColorBlend()
  rl.lib.rlDisableColorBlend()
end
function rl:rlEnableDepthTest()
  rl.lib.rlEnableDepthTest()
end
function rl:rlDisableDepthTest()
  rl.lib.rlDisableDepthTest()
end
function rl:rlEnableDepthMask()
  rl.lib.rlEnableDepthMask()
end
function rl:rlDisableDepthMask()
  rl.lib.rlDisableDepthMask()
end
function rl:rlEnableBackfaceCulling()
  rl.lib.rlEnableBackfaceCulling()
end
function rl:rlDisableBackfaceCulling()
  rl.lib.rlDisableBackfaceCulling()
end
function rl:rlColorMask(r, g, b, a)
  rl.lib.rlColorMask(r, g, b, a)
end
function rl:rlSetCullFace(mode)
  rl.lib.rlSetCullFace(mode)
end
function rl:rlEnableScissorTest()
  rl.lib.rlEnableScissorTest()
end
function rl:rlDisableScissorTest()
  rl.lib.rlDisableScissorTest()
end
function rl:rlScissor(x, y, width, height)
  rl.lib.rlScissor(x, y, width, height)
end
function rl:rlEnableWireMode()
  rl.lib.rlEnableWireMode()
end
function rl:rlEnablePointMode()
  rl.lib.rlEnablePointMode()
end
function rl:rlDisableWireMode()
  rl.lib.rlDisableWireMode()
end
function rl:rlSetLineWidth(width)
  rl.lib.rlSetLineWidth(width)
end
function rl:rlGetLineWidth()
  return rl.lib.rlGetLineWidth()
end
function rl:rlEnableSmoothLines()
  rl.lib.rlEnableSmoothLines()
end
function rl:rlDisableSmoothLines()
  rl.lib.rlDisableSmoothLines()
end
function rl:rlEnableStereoRender()
  rl.lib.rlEnableStereoRender()
end
function rl:rlDisableStereoRender()
  rl.lib.rlDisableStereoRender()
end
function rl:rlIsStereoRenderEnabled()
  return rl.lib.rlIsStereoRenderEnabled()
end
function rl:rlClearColor(r, g, b, a)
  rl.lib.rlClearColor(r, g, b, a)
end
function rl:rlClearScreenBuffers()
  rl.lib.rlClearScreenBuffers()
end
function rl:rlCheckErrors()
  rl.lib.rlCheckErrors()
end
function rl:rlSetBlendMode(mode)
  rl.lib.rlSetBlendMode(mode)
end
function rl:rlSetBlendFactors(glSrcFactor, glDstFactor, glEquation)
  rl.lib.rlSetBlendFactors(glSrcFactor, glDstFactor, glEquation)
end
function rl:rlSetBlendFactorsSeparate(glSrcRGB, glDstRGB, glSrcAlpha, glDstAlpha, glEqRGB, glEqAlpha)
  rl.lib.rlSetBlendFactorsSeparate(glSrcRGB, glDstRGB, glSrcAlpha, glDstAlpha, glEqRGB, glEqAlpha)
end
function rl:rlglInit(width, height)
  rl.lib.rlglInit(width, height)
end
function rl:rlglClose()
  rl.lib.rlglClose()
end
function rl:rlLoadExtensions(loader)
  rl.lib.rlLoadExtensions(loader)
end
function rl:rlGetVersion()
  return rl.lib.rlGetVersion()
end
function rl:rlSetFramebufferWidth(width)
  rl.lib.rlSetFramebufferWidth(width)
end
function rl:rlGetFramebufferWidth()
  return rl.lib.rlGetFramebufferWidth()
end
function rl:rlSetFramebufferHeight(height)
  rl.lib.rlSetFramebufferHeight(height)
end
function rl:rlGetFramebufferHeight()
  return rl.lib.rlGetFramebufferHeight()
end
function rl:rlGetTextureIdDefault()
  return rl.lib.rlGetTextureIdDefault()
end
function rl:rlGetShaderIdDefault()
  return rl.lib.rlGetShaderIdDefault()
end
function rl:rlGetShaderLocsDefault()
  return rl.lib.rlGetShaderLocsDefault()
end
function rl:rlLoadRenderBatch(numBuffers, bufferElements)
  return rl.lib.rlLoadRenderBatch(numBuffers, bufferElements)
end
function rl:rlUnloadRenderBatch(batch)
  rl.lib.rlUnloadRenderBatch(batch)
end
function rl:rlDrawRenderBatch(batch)
  rl.lib.rlDrawRenderBatch(batch)
end
function rl:rlSetRenderBatchActive(batch)
  rl.lib.rlSetRenderBatchActive(batch)
end
function rl:rlDrawRenderBatchActive()
  rl.lib.rlDrawRenderBatchActive()
end
function rl:rlCheckRenderBatchLimit(vCount)
  return rl.lib.rlCheckRenderBatchLimit(vCount)
end
function rl:rlSetTexture(id)
  rl.lib.rlSetTexture(id)
end
function rl:rlLoadVertexArray()
  return rl.lib.rlLoadVertexArray()
end
function rl:rlLoadVertexBuffer(buffer, size, dynamic)
  return rl.lib.rlLoadVertexBuffer(buffer, size, dynamic)
end
function rl:rlLoadVertexBufferElement(buffer, size, dynamic)
  return rl.lib.rlLoadVertexBufferElement(buffer, size, dynamic)
end
function rl:rlUpdateVertexBuffer(bufferId, data, dataSize, offset)
  rl.lib.rlUpdateVertexBuffer(bufferId, data, dataSize, offset)
end
function rl:rlUpdateVertexBufferElements(id, data, dataSize, offset)
  rl.lib.rlUpdateVertexBufferElements(id, data, dataSize, offset)
end
function rl:rlUnloadVertexArray(vaoId)
  rl.lib.rlUnloadVertexArray(vaoId)
end
function rl:rlUnloadVertexBuffer(vboId)
  rl.lib.rlUnloadVertexBuffer(vboId)
end
function rl:rlSetVertexAttribute(index, compSize, type, normalized, stride, pointer)
  rl.lib.rlSetVertexAttribute(index, compSize, type, normalized, stride, pointer)
end
function rl:rlSetVertexAttributeDivisor(index, divisor)
  rl.lib.rlSetVertexAttributeDivisor(index, divisor)
end
function rl:rlSetVertexAttributeDefault(locIndex, value, attribType, count)
  rl.lib.rlSetVertexAttributeDefault(locIndex, value, attribType, count)
end
function rl:rlDrawVertexArray(offset, count)
  rl.lib.rlDrawVertexArray(offset, count)
end
function rl:rlDrawVertexArrayElements(offset, count, buffer)
  rl.lib.rlDrawVertexArrayElements(offset, count, buffer)
end
function rl:rlDrawVertexArrayInstanced(offset, count, instances)
  rl.lib.rlDrawVertexArrayInstanced(offset, count, instances)
end
function rl:rlDrawVertexArrayElementsInstanced(offset, count, buffer, instances)
  rl.lib.rlDrawVertexArrayElementsInstanced(offset, count, buffer, instances)
end
function rl:rlLoadTexture(data, width, height, format, mipmapCount)
  return rl.lib.rlLoadTexture(data, width, height, format, mipmapCount)
end
function rl:rlLoadTextureDepth(width, height, useRenderBuffer)
  return rl.lib.rlLoadTextureDepth(width, height, useRenderBuffer)
end
function rl:rlLoadTextureCubemap(data, size, format)
  return rl.lib.rlLoadTextureCubemap(data, size, format)
end
function rl:rlUpdateTexture(id, offsetX, offsetY, width, height, format, data)
  rl.lib.rlUpdateTexture(id, offsetX, offsetY, width, height, format, data)
end
function rl:rlGetGlTextureFormats(format, glInternalFormat, glFormat, glType)
  rl.lib.rlGetGlTextureFormats(format, glInternalFormat, glFormat, glType)
end
function rl:rlGetPixelFormatName(format)
  return ffi.string(rl.lib.rlGetPixelFormatName(format))
end
function rl:rlUnloadTexture(id)
  rl.lib.rlUnloadTexture(id)
end
function rl:rlGenTextureMipmaps(id, width, height, format, mipmaps)
  rl.lib.rlGenTextureMipmaps(id, width, height, format, mipmaps)
end
function rl:rlReadTexturePixels(id, width, height, format)
  return rl.lib.rlReadTexturePixels(id, width, height, format)
end
function rl:rlReadScreenPixels(width, height)
  return rl.lib.rlReadScreenPixels(width, height)
end
function rl:rlLoadFramebuffer(width, height)
  return rl.lib.rlLoadFramebuffer(width, height)
end
function rl:rlFramebufferAttach(fboId, texId, attachType, texType, mipLevel)
  rl.lib.rlFramebufferAttach(fboId, texId, attachType, texType, mipLevel)
end
function rl:rlFramebufferComplete(id)
  return rl.lib.rlFramebufferComplete(id)
end
function rl:rlUnloadFramebuffer(id)
  rl.lib.rlUnloadFramebuffer(id)
end
function rl:rlLoadShaderCode(vsCode, fsCode)
  return rl.lib.rlLoadShaderCode(rl.char_ptr(vsCode), rl.char_ptr(fsCode))
end
function rl:rlCompileShader(shaderCode, type)
  return rl.lib.rlCompileShader(rl.char_ptr(shaderCode), type)
end
function rl:rlLoadShaderProgram(vShaderId, fShaderId)
  return rl.lib.rlLoadShaderProgram(vShaderId, fShaderId)
end
function rl:rlUnloadShaderProgram(id)
  rl.lib.rlUnloadShaderProgram(id)
end
function rl:rlGetLocationUniform(shaderId, uniformName)
  return rl.lib.rlGetLocationUniform(shaderId, rl.char_ptr(uniformName))
end
function rl:rlGetLocationAttrib(shaderId, attribName)
  return rl.lib.rlGetLocationAttrib(shaderId, rl.char_ptr(attribName))
end
function rl:rlSetUniform(locIndex, value, uniformType, count)
  rl.lib.rlSetUniform(locIndex, value, uniformType, count)
end
function rl:rlSetUniformMatrix(locIndex, mat)
  rl.lib.rlSetUniformMatrix(locIndex, mat)
end
function rl:rlSetUniformSampler(locIndex, textureId)
  rl.lib.rlSetUniformSampler(locIndex, textureId)
end
function rl:rlSetShader(id, locs)
  rl.lib.rlSetShader(id, locs)
end
function rl:rlLoadComputeShaderProgram(shaderId)
  return rl.lib.rlLoadComputeShaderProgram(shaderId)
end
function rl:rlComputeShaderDispatch(groupX, groupY, groupZ)
  rl.lib.rlComputeShaderDispatch(groupX, groupY, groupZ)
end
function rl:rlLoadShaderBuffer(size, data, usageHint)
  return rl.lib.rlLoadShaderBuffer(size, data, usageHint)
end
function rl:rlUnloadShaderBuffer(ssboId)
  rl.lib.rlUnloadShaderBuffer(ssboId)
end
function rl:rlUpdateShaderBuffer(id, data, dataSize, offset)
  rl.lib.rlUpdateShaderBuffer(id, data, dataSize, offset)
end
function rl:rlBindShaderBuffer(id, index)
  rl.lib.rlBindShaderBuffer(id, index)
end
function rl:rlReadShaderBuffer(id, dest, count, offset)
  rl.lib.rlReadShaderBuffer(id, dest, count, offset)
end
function rl:rlCopyShaderBuffer(destId, srcId, destOffset, srcOffset, count)
  rl.lib.rlCopyShaderBuffer(destId, srcId, destOffset, srcOffset, count)
end
function rl:rlGetShaderBufferSize(id)
  return rl.lib.rlGetShaderBufferSize(id)
end
function rl:rlBindImageTexture(id, index, format, readonly)
  rl.lib.rlBindImageTexture(id, index, format, readonly)
end
function rl:rlGetMatrixModelview()
  return rl.lib.rlGetMatrixModelview()
end
function rl:rlGetMatrixProjection()
  return rl.lib.rlGetMatrixProjection()
end
function rl:rlGetMatrixTransform()
  return rl.lib.rlGetMatrixTransform()
end
function rl:rlGetMatrixProjectionStereo(eye)
  return rl.lib.rlGetMatrixProjectionStereo(eye)
end
function rl:rlGetMatrixViewOffsetStereo(eye)
  return rl.lib.rlGetMatrixViewOffsetStereo(eye)
end
function rl:rlSetMatrixProjection(proj)
  rl.lib.rlSetMatrixProjection(proj)
end
function rl:rlSetMatrixModelview(view)
  rl.lib.rlSetMatrixModelview(view)
end
function rl:rlSetMatrixProjectionStereo(right, left)
  rl.lib.rlSetMatrixProjectionStereo(right, left)
end
function rl:rlSetMatrixViewOffsetStereo(right, left)
  rl.lib.rlSetMatrixViewOffsetStereo(right, left)
end
function rl:rlLoadDrawCube()
  rl.lib.rlLoadDrawCube()
end
function rl:rlLoadDrawQuad()
  rl.lib.rlLoadDrawQuad()
end
return rl
