--[[
Copyright (C) 2018 Sean Anderson

This file is part of Realistic Nukes

Realistic Nukes is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Realistic Nukes is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
--]]

local effects = require("effects")
local const = require("const")
local util = require("util")
local cfg = require("cfg")

local pressures = effects.get_pressures(cfg.scale, cfg.height)

-- How spread out the individual explosions are
-- This really helps reduce the amount of projectiles needed
local sparse = 1

local protos = {}


local projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"])
projectile.name = "nuke-shell"
projectile.map_color = {r=0, g=1, b=0}
projectile.picture.filename = "__real-nukes__/graphics/nuke-shell.png"
projectile.chart_picture.filename = "__real-nukes__/graphics/nuke-shoot-map-visualization.png"
projectile.height_from_ground = cfg.height

target_effects = {}
last_damage = 0
for range, p in util.spairs(pressures, function(a,b) return a >= b end) do
	damage = p * const.psi_dmg
	log(range .. " " .. damage .. " " .. last_damage)
	table.insert(target_effects, {
		type = "nested-result",
		action = {
			type = "area",
			radius = range,
			action_delivery = {
				type = "instant",
				target_effects = {
					{
						type = "damage",
						damage = {amount = damage - last_damage, type = "explosion"},
					},
					{
						type = "show-explosion-on-chart",
						scale = 1
					}
				}
			}
		}
	})
	last_damage = damage
end
projectile.action.action_delivery.target_effects = target_effects
table.insert(protos, projectile)

local nuke = table.deepcopy(data.raw.ammo["artillery-shell"])
nuke.name = "nuke"
nuke.icon = "__real-nukes__/graphics/nuke.png"
nuke.ammo_type.action.action_delivery.projectile = "nuke-shell"
table.insert(protos, nuke)

table.insert(protos, {
	type = "recipe",
	name = "nuke",
	enabled = false,
	energy_required = 75,
	ingredients = {
		{"artillery-shell", 1},
		{"atomic-bomb", 1}
	},
	result = "nuke"
})

print("Hello world!")
data:extend(protos)
