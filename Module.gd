extends Module

func getFlags():
    return {
        "Basic": flag(FlagType.Bool),
        "Advance": flag(FlagType.Bool),
    }
var gid = ""

func _init():
    id = "selfFight"
    gid = "selfFight"
    author = "CanInBad"
    events = [
        "res://Modules/selfFight/events/upgrades.gd",
    ]
    Console.addCommand("warp",self,"doWarp",["location"])
    Console.addCommand("gotoScene",self,"runScene",["sceneID"])

func doWarp(roomID):
    if GM.main != null:
        if GM.main.getCurrentScene().sceneID == "WorldScene":
            if GM.world.hasRoomID(roomID):
                Log.print("\t"+id+": Successfully set player to roomID "+roomID)
                GM.main.aimCameraAndSetLocName(roomID)
                GM.pc.setLocation(roomID)
                GM.main.reRun()
            else: Log.printerr("\t"+id+": Room ID "+ roomID + " does not exist!")
        else: Log.printerr("\t"+id+": Currently is not in free roam")
    else: Log.printerr("\t"+id+": Currently not in the game")

func runScene(sceneID):
    if GM.main != null:
        Log.print("\t"+id+":attempting to run "+sceneID)
        GM.main.runScene(sceneID)
        GM.main.reRun()
    else: Log.printerr("\t"+id+": Currently not in the game")