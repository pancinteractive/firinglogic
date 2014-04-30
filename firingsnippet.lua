-- firingsnippet.lua
local GameSettings = {}
local pf = {}
pf.projThrow1 = {}
GameSettings.lockStatus = false





		local function gunShot2(yT,lFa,xLoc,yLoc,collisionObject)
		  -- yT = number of projectile. Useful when firing several projectiles at once.
		  -- lFa = time limit before next projectile can be shot
		  -- xLoc, yLoc = x and y coordinate locations for start of projectile origin
		  -- collisionObject is the object with which this projectile will react. This is less than ideal, as it relegates your projectile to interacting with one object. You could perhaps use a table here with all your objects contained within. I'll cover that later.
			if GameSettings.lockStatus == false then
				GameSettings.lockStatus = true
				pf.projThrow1[yT] = display.newRect(0,0,2,6)
				pf.projThrow1[yT].x = xLoc
				pf.projThrow1[yT].y = yLoc
				pf.projThrow1[yT].alpha = 1
				physics.addBody(pf.projThrow1[yT], "kinematic", { density = .25, friction = 0, bounce = 0, isSensor = true })

					local function moveShot(obj)
						obj.y = 1800
						display.remove(obj)
						obj=nil
					end
					print("GameSettings.bulletCount = "..GameSettings.bulletCount)
					
					local function shotCollision()
						--for a=1, collisionObject do
						if pf.projThrow1[yT] and hasCollided(pf.projThrow1[yT], collisionObject) then
							print("************ PROJECTILE HAS HIT TARGET ************* ")
							
              pf.projThrow1[yT].y = 1800
					  	display.remove(	pf.projThrow1[yT])
							pf.projThrow1[yT]=nil
							
							Runtime:removeEventListener("enterFrame", shotCollision)
				
						end
					end
				end

					runtime:addEventListener("enterFrame", shotCollision)
					-- transition.to(pf.projThrow1[yT], {time=420,x=pf.mrlocutor.x+(120*pf.mrlocutor.xScale), onComplete=moveShot})
					transition.to(pf.projThrow1[yT], {time=350,onComplete=moveShot})
					pf.projThrow1[yT]:setLinearVelocity(pf.projThrow1[yT].xScale*150, pf.mrlocutorgunarm.rotation*(pf.projThrow1[yT].xScale*4), pf.projThrow1[yT].x, pf.projThrow1[yT].y)
				timer.performWithDelay(lFa, function()
					GameSettings.lockStatus = false
					print(" &====<>====$ STANDREADY &====<>====$ ")
				end, 1)
			end
		end
