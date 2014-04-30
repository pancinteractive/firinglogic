		local function enemyGuardBotAI()
						for a=1, 15 do
						if enemies.enemiesguardbot[yT].hitBox and playerfile.projThrow1[a] and hasCollided(playerfile.projThrow1[a], enemies.enemiesguardbot[yT].hitBox) then
							enemies.enemiesenemGuardBotHitPoints[yT] = enemies.enemiesenemGuardBotHitPoints[yT]-1
							print("enemies.enemiesenemGuardBotHitPoints["..yT.."] = "..tostring(enemies.enemiesenemGuardBotHitPoints[yT]))
							playerfile.projThrow1[a].y = 1800
							Runtime:removeEventListener("enterFrame", shotCollision)
							timer.performWithDelay(70, function()
							print("COLOR CHANGING")
								enemies.enemiesguardbot[yT]:setFillColor(1,0,0)
									timer.performWithDelay(35, function()
										enemies.enemiesguardbot[yT]:setFillColor(1)
									end, 1)
							end, 3)						
						end
					end
			enemies.enemiesguardbot[yT].x = enemies.enemiesguardbot[yT].hitBox.x 
			enemies.enemiesguardbot[yT].y = enemies.enemiesguardbot[yT].hitBox.y-10
			if enemies.enemiesguardbot[yT].hitBox.x <= fX-50 then
				enemies.enemiesguardbot[yT].rnd1 = 60
				enemies.enemiesguardbot[yT].xScale = -1
				--print("MOVING RIGHT"..yT)
			elseif enemies.enemiesguardbot[yT].hitBox.x >= fX+50 then
				enemies.enemiesguardbot[yT].rnd1 = -60
				enemies.enemiesguardbot[yT].xScale = 1
				--print("MOVING LEFT"..yT)
			end	
			if enemies.enemiesenemGuardBotHitPoints[yT] <= 0 then
				itemspawn.randItemDrop(rndDrop(rrW),yT+GameSettings.spawnNum1,2,enemies.enemiesguardbot[yT].hitBox.x,enemies.enemiesguardbot[yT].hitBox.y)
					SavedGameOneSettings.scoreAmount = SavedGameOneSettings.scoreAmount+15
					enemies.scoreText2.text = SavedGameOneSettings.scoreAmount
				partBurst(enemies.enemiesguardbot[yT])
				enemies.enemiesguardbot[yT].isAlive = false
				enemies.enemiesguardbot[yT].hitBox:setLinearVelocity(0,0)
				Runtime:removeEventListener("enterFrame", enemyGuardBotAI)
				transition.to(enemies.enemiesguardbot[yT], {time=250, delay=500, alpha=0, onComplete=DestroyObj})
				display.remove(enemies.enemiesguardbot[yT].hitBox)
				enemies.enemiesguardbot[yT].hitBox=nil
			end
			if SavedGameOneSettings.hitPoints <= 0 then
				enemies.enemiesguardbot[yT].isAlive = false
				enemies.enemiesguardbot[yT].hitBox:setLinearVelocity(0,0)
				Runtime:removeEventListener("enterFrame", enemyGuardBotAI)
				transition.to(enemies.enemiesguardbot[yT], {time=250, delay=500, alpha=0, onComplete=DestroyObj})
				display.remove(enemies.enemiesguardbot[yT].hitBox)
				enemies.enemiesguardbot[yT].hitBox=nil
			end
		end	
