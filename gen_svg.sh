#!/bin/bash
#
# gen running page svg



set -e

# todo: gen data
# python scripts/nike_sync.py ${nike refresh_token}


# gen {Your Name} Running SVG
python scripts/gen_svg.py --from-db --title "Running Records" --type github --athlete "FrankSun" \
    --special-distance 10 --special-distance2 20 --special-color yellow --special-color2 red \
    --output assets/github.svg --use-localtime --min-distance 0.5

# gen everyear {Your Name} Running SVG
for i in 2020 2021; do
    python scripts/gen_svg.py --from-db --year ${i} \--title "${i} Running" --type github --athlete "FrankSun" \
        --special-distance 10 --special-distance2 20 --special-color yellow --special-color2 red \
        --output assets/github_${i}.svg --use-localtime --min-distance 0.5
done

# Over 10/20 KM Running SVG
python scripts/gen_svg.py --from-db --title "Over 10km Runs" --type grid --athlete "FrankSun" \
    --output assets/grid.svg \
    --min-distance 10.0 --special-color yellow --special-color2 red \
    --special-distance 20 --special-distance2 40 --use-localtime

# gen circular SVG
python scripts/gen_svg.py --from-db --title "Over 10km Runs" --type grid --athlete "FrankSun" \
    --output assets/grid.svg \
    --min-distance 10.0 --special-color yellow --special-color2 red \
    --special-distance 20 --special-distance2 40 --use-localtime
