warn("Checking if any files are missing...")
do
    makefolder("Helltaker")

    local Files = {
        "TRC_Agent.png",
        "TRC_Annihilator.png",
        "TRC_Arsonist.png",
        "TRC_Brute.png",
        "TRC_Doctor.png",
        "TRC_Flanker.png",
        "TRC_Marksman.png",
        "TRC_Mechanic.png",
        "TRC_Trooper.png",

        "TGC_Agent.png",
        "TGC_Annihilator.png",
        "TGC_Arsonist.png",
        "TGC_Brute.png",
        "TGC_Doctor.png",
        "TGC_Flanker.png",
        "TGC_Marksman.png",
        "TGC_Mechanic.png",
        "TGC_Trooper.png",
    }

    for i,v in next, Files do
        if not isfile("Helltaker/" .. v) then
            print(v .. " not found, downloading..")

            local Time = tick()
            local Image = request({Url = "https://raw.githubusercontent.com/parrot121761/TC2-Helltaker-Portraits/refs/heads/main/portraits/" .. v}).Body

            if Image then
                print(v .. " downloaded in "..string.format("%.2f", tick() - Time).."s.")
                writefile("Helltaker/" .. v, Image)
            else
                warn(v .. " failed to download.")
            end
        end
    end
end
warn("All done, loading code")

local Icons = {
    ["TRC_Agent"] = getcustomasset("Helltaker/TRC_Agent.png"),
    ["TRC_Annihilator"] = getcustomasset("Helltaker/TRC_Annihilator.png"),
    ["TRC_Arsonist"] = getcustomasset("Helltaker/TRC_Arsonist.png"),
    ["TRC_Brute"] = getcustomasset("Helltaker/TRC_Brute.png"),
    ["TRC_Doctor"] = getcustomasset("Helltaker/TRC_Doctor.png"),
    ["TRC_Flanker"] = getcustomasset("Helltaker/TRC_Flanker.png"),
    ["TRC_Marksman"] = getcustomasset("Helltaker/TRC_Marksman.png"),
    ["TRC_Mechanic"] = getcustomasset("Helltaker/TRC_Mechanic.png"),
    ["TRC_Trooper"] = getcustomasset("Helltaker/TRC_Trooper.png"),

    ["TGC_Agent"] = getcustomasset("Helltaker/TGC_Agent.png"),
    ["TGC_Annihilator"] = getcustomasset("Helltaker/TGC_Annihilator.png"),
    ["TGC_Arsonist"] = getcustomasset("Helltaker/TGC_Arsonist.png"),
    ["TGC_Brute"] = getcustomasset("Helltaker/TGC_Brute.png"),
    ["TGC_Doctor"] = getcustomasset("Helltaker/TGC_Doctor.png"),
    ["TGC_Flanker"] = getcustomasset("Helltaker/TGC_Flanker.png"),
    ["TGC_Marksman"] = getcustomasset("Helltaker/TGC_Marksman.png"),
    ["TGC_Mechanic"] = getcustomasset("Helltaker/TGC_Mechanic.png"),
    ["TGC_Trooper"] = getcustomasset("Helltaker/TGC_Trooper.png"),
}

repeat task.wait() until game:IsLoaded()
local LocalPlayer = cloneref(game:GetService("Players")).LocalPlayer

local Portrait = LocalPlayer:WaitForChild("PlayerGui", 9e9):WaitForChild("HUDGui", 9e9):WaitForChild("HUD", 9e9):WaitForChild("HealthGUI", 9e9):WaitForChild("Class", 9e9) -- tc2 is so sigma
Portrait:GetPropertyChangedSignal("Image"):Connect(function()
    local Disguised = LocalPlayer.Character:FindFirstChild("Disguised")
    if Disguised then
        Portrait.Image = Icons[Disguised:GetAttribute("Team") .. "_" .. Disguised:GetAttribute("Class")]
        return
    end
    if Icons[LocalPlayer.Status.Team.Value .. "_" .. LocalPlayer.Status.Class.Value] then
        Portrait.Image = Icons[LocalPlayer.Status.Team.Value .. "_" .. LocalPlayer.Status.Class.Value]
    end
end)


