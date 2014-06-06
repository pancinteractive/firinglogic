-- firingsnippet.lua
local GameSettings = {}
local pf = {}
pf.projThrow1 = {}
GameSettings.lockStatus = false
local lFa = 450 -- repeat fire rate



	local function gunShot(yT) -- yT is the projectile counter which is being shot, and needs to be incremented upwards. 
		if GameSettings.lockStatus == false then
			GameSettings.lockStatus = true
			pf.projThrow1[yT] = display.newRect(0,0,20,10)
			pf.projThrow1[yT].alpha = 1
			pf.projThrow1[yT].x = pf.mrlocutorgunarm.x+(GameSettings.armXPF*pf.mrlocutor.xScale)
			pf.projThrow1[yT].y = pf.mrlocutorgunarm.y-(GameSettings.armYPF)
			physics.addBody(pf.projThrow1[yT], "kinematic", { density = .25, friction = 0, bounce = 0, isSensor = true })
					local function moveShot(obj)
						--obj.y = 1800
						display.remove(obj)
						obj=nil
					end
				statushud.clipSize.text = GameSettings.clipSize.."/"
				--heroChargeStash[#heroChargeStash+1] = transition.to(pf.projThrow1[yT], {time=420,x=pf.mrlocutor.x+(120*pf.mrlocutor.xScale), onComplete=moveShot})
				heroChargeStash[#heroChargeStash+1] = transition.to(pf.projThrow1[yT], {time=lFa+80,onComplete=moveShot})
				pf.projThrow1[yT]:setLinearVelocity(pf.projThrow1[yT].xScale*50, (pf.projThrow1[yT].yScale*3), pf.projThrow1[yT].x, pf.projThrow1[yT].y)
			timer.performWithDelay(lFa, function()
				GameSettings.lockStatus = false
			end, 1)
		end
	end
