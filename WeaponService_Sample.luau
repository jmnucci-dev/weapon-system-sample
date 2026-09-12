const function rewindAndResolve(
	shooter: Player,
	rewindTo: number,
	origin: Vector3,
	direction: Vector3,
	weapon: Weapon.Weapon,
	filterInstances: { Instance },
	spreadSeed: number
)
	const activeHitboxes: { [Part]: { Player: Player, IsHead: boolean } } = {}
	const touchedHitboxes: { PlayerHitboxes } = {}

	for _, player in Players:GetPlayers() do
		if player == shooter then
			continue
		end

		const character = getAliveCharacter(player)

		if not character then
			continue
		end

		const entity = Holder.GetEntityFromPlayer(player)

		if not entity then
			continue
		end

		const rewoundCFrame = if entity.snapshot then entity.snapshot:GetAt(rewindTo) else nil

		if not rewoundCFrame then
			continue
		end

		const hitboxes = getOrCreateHitbox(player)

		hitboxes.Body.CFrame = rewoundCFrame + Config.BODY_HITBOX_OFFSET
		hitboxes.Head.CFrame = rewoundCFrame + Config.HEAD_HITBOX_OFFSET

		activeHitboxes[hitboxes.Body] = { Player = player, IsHead = false }
		activeHitboxes[hitboxes.Head] = { Player = player, IsHead = true }

		table.insert(touchedHitboxes, hitboxes)
	end

	const random = Random.new(spreadSeed)

	const hits = Utils.ResolveHitscan(origin, direction, weapon.config, filterInstances, random)

	for _, hitboxes in touchedHitboxes do
		parkHitboxes(hitboxes)
	end

	for _, hit in hits do
		if hit.Instance then
			const entry = activeHitboxes[hit.Instance :: Part]

			if entry then
				const targetChar = getAliveCharacter(entry.Player)

				if targetChar then
					hit.Humanoid = targetChar:FindFirstChildOfClass("Humanoid")
					hit.IsHeadshot = entry.IsHead
				end
			end
		end
	end

	return hits
end
