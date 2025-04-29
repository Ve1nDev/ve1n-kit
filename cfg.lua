Ve1n = {}

Ve1n.Items = {
    ["bag2"] = {
        items = {
            {item = "ammo-9", adet = 20},
            {item = "heavyarmor", adet = 10},
            {item = "weapon_glock", adet = 1},
            {item = "bandage", adet = 10},
            {item = "phone", adet = 1}

        },
        notify = {
            atsinmi = true,
            mesaj = "Polis Kiti Kullandın!"
        },
        meslek = {
            kontroletsinmi = false,
        }
    },
    ["bag"] = {
        items = {
            {item = "weapon_browning", adet = 1},
            {item = "heavyarmor", adet = 10},
            {item = "ammo-9", adet = 25}
        },
        notify = {
            atsinmi = true,
            mesaj = "policek iti 31"
        },
        meslek = {
            kontroletsinmi = true,
            meslekler = {"police", "ems"}
        }
    }
}