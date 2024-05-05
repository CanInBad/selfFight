extends EventBase

func registerTriggers(es):
	es.addTrigger(self, Trigger.SceneAndStateHook, ["SocketBuyCellUpgradesScene",""])

func run(_triggerID, _args):
    sayn("[i][center]SelfFight Module[/center][/i]")
    # GM.main.getCurrentScene().addButton("Test Change Scene","Test scene change", "endthescene")
    var hasBasic = getFlag("selfFight.Basic", false)
    var basicPrice = 20
    sayn("[b]Cloning vat[/b]")
    sayn("Install a cloning device for all your fighting (and love) needs!")
    saynn("Cost: "+((str(basicPrice)+" credits") if !hasBasic else "Bought!")+"")
    if !hasBasic:
        GM.main.getCurrentScene().addButtonWithChecks("Cloning vat", "Pay to get a cloning vat installed in your cell", "pay_upgrade", ["selfFight.Basic", basicPrice, "A cloning vat has been installed in your cell"], [[ButtonChecks.HasCredits, basicPrice]])
