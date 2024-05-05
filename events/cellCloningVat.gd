extends EventBase

func registerTriggers(es):
    es.addTrigger(self, Trigger.EnteringPlayerCell)

func run(_triggerID, _args):
    if !GM.pc.hasBlockedHands():
        addButton("yes","yes","test")

func onButton(_method, _args):
    if _method == "test":
        print("yes")