# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  "Personal Computers",
  "Smartphones & Tablets",
  "Smartwatches & Wearables",
  "Home Entertainment",
  "Kitchen Appliances",
  "Home Comfort Devices",
  "Cleaning Appliances",
  "Smart Home Gadgets",
  "Office Equipment",
  "Networking Gear",
  "Health & Fitness Devices",
  "Medical Equipment",
  "Automotive Tech",
  "Outdoor & Garden Tools",
  "DIY & Power Tools",
  "Audio & Music Devices",
  "Cameras & Photography Gear",
  "Gaming Accessories",
  "Travel & Portable Gadgets",
  "Industrial & Workplace Tools"
].each do |name|
  slug = name.parameterize.gsub("-", "_")
  Category.find_or_create_by!(category_name: name).update!(image: "#{slug}.png")
end

# Seed devices across all categories
devices_data = [
  # ── Personal Computers ───────────────────────────────────────────────────────
  [
    "Personal Computers",
    "Apple MacBook Pro 14-inch M3 Pro",
    <<~MD,
      ## Getting Started
      1. Open the lid — the MacBook Pro powers on automatically.
      2. Complete macOS setup (language, Wi-Fi, Apple ID sign-in).
      3. Use Touch ID on the power button to unlock after sleep.

      ## Basic Use
      - **Trackpad:** Two-finger scroll; pinch to zoom; tap to click.
      - **Mission Control:** Swipe up with three fingers to see all open windows.
      - **Spotlight:** Press **⌘ Space** to search apps, files, and the web.

      ## Power & Charging
      - Charge via either MagSafe 3 port or either Thunderbolt 4 port.
      - Battery status appears in the menu bar; aim to keep it between 20 % and 80 % for longevity.
    MD
    ["Apple MacBook Pro 16-inch M3 Max", "Apple MacBook Air 15-inch M3", "Lenovo ThinkPad X1 Carbon Gen 12", "Dell XPS 15 9530", "HP Spectre x360 14", "Microsoft Surface Laptop Studio 2", "Asus ProArt Studiobook 16 OLED", "Razer Blade 16 2024", "LG Gram 16 2024", "Samsung Galaxy Book4 Pro 360 16", "Huawei MateBook X Pro 2024", "Acer Swift X 14", "MSI Prestige 16 AI Evo", "HP Omen Transcend 14", "Lenovo Yoga 9i Gen 9"]
  ],
  [
    "Personal Computers",
    "Dell XPS 15 9530",
    <<~MD,
      ## First Boot
      1. Press the power button (top-right of keyboard).
      2. Follow the Windows 11 setup wizard — connect to Wi-Fi and sign in with a Microsoft account.
      3. Install pending Windows Updates via **Settings › Windows Update**.

      ## Everyday Tips
      - **Snap Layouts:** Hover over a window's maximise button to choose a split-screen layout.
      - **Task View:** Press **Win + Tab** to switch between virtual desktops.
      - **Battery Saver:** Click the battery icon in the system tray and drag the slider.

      ## Display
      - Right-click the desktop › **Display settings** to adjust resolution and scaling.
      - The OLED panel supports touch input — swipe inward from the right edge to open the Action Centre.
    MD
    ["Dell XPS 13 9340", "Apple MacBook Pro 14-inch M3 Pro", "Lenovo IdeaPad Slim 5 16", "HP Envy 16", "Asus ZenBook Pro 16X OLED", "Microsoft Surface Pro 10 13", "Acer Swift 14 AI", "Samsung Galaxy Book4 360 13.3", "LG Gram 14 2024", "HP Pavilion Plus 14", "Lenovo Yoga 7i 14 Gen 9", "Asus Vivobook S 14 OLED", "Huawei MateBook D 14 2024", "MSI Modern 14 AI C1MG", "Toshiba Portege X30L-K"]
  ],
  [
    "Personal Computers",
    "Lenovo ThinkPad X1 Carbon Gen 12",
    <<~MD,
      ## Setup
      1. Power on with the fingerprint reader or top-row power key.
      2. Complete Windows 11 setup; enrol your fingerprint when prompted.
      3. Open **Lenovo Vantage** to update drivers and configure battery thresholds.

      ## TrackPoint & Touchpad
      - The red TrackPoint nub in the keyboard centre moves the cursor without lifting your hands.
      - Middle TrackPoint button + scroll = page scroll; useful when navigating long documents.

      ## Security
      - Press **Ctrl + Alt + Del** and select **Lock** when stepping away.
      - The physical webcam shutter on the bezel blocks the camera lens.
    MD
    ["Lenovo ThinkPad X1 Yoga Gen 9", "Dell Latitude 7450", "HP EliteBook 840 G11", "Apple MacBook Air 13-inch M3", "Microsoft Surface Laptop 6 13.5", "Dell Latitude 5550", "HP ZBook Power G10", "Lenovo ThinkPad T14s Gen 5", "Asus ExpertBook B9 OLED B9403CVA", "Panasonic Toughbook CF-54", "Getac B360 Pro", "Dell Precision 3591", "HP EliteBook 1040 G11", "Lenovo ThinkPad L14 Gen 5", "Microsoft Surface Pro 10 for Business"]
  ],

  # ── Smartphones & Tablets ────────────────────────────────────────────────────
  [
    "Smartphones & Tablets",
    "Apple iPhone 15 Pro",
    <<~MD,
      ## Unlocking
      1. Press the side button or lift the phone (Raise to Wake).
      2. Glance at the screen — Face ID unlocks in under a second.
      3. Swipe up from the bottom to reach the Home Screen.

      ## Action Button
      - Long-press the Action Button (left side) to trigger your chosen shortcut: Silent Mode, Camera, Torch, etc.
      - Customise it in **Settings › Action Button**.

      ## Camera
      1. Open the **Camera** app or press the Action Button if set.
      2. Swipe left/right between Photo, Video, Portrait, and Cinematic modes.
      3. Tap the **3×** lens icon to switch to the 3× telephoto.
    MD
    ["Apple iPhone 15 Pro Max", "Samsung Galaxy S24 Ultra", "Google Pixel 9 Pro", "OnePlus 12", "Sony Xperia 1 VI", "Xiaomi 14 Pro", "Motorola Edge 50 Ultra", "Vivo X100 Pro", "OPPO Find X7 Ultra", "Nothing Phone 2a Plus", "Asus ROG Phone 8 Pro", "Honor Magic6 Pro", "Realme GT 6 Pro", "HMD Pulse Pro", "Samsung Galaxy A55 5G", "OnePlus Nord 4", "Nubia Z60 Ultra"]
  ],
  [
    "Smartphones & Tablets",
    "Samsung Galaxy S24 Ultra",
    <<~MD,
      ## First Use
      1. Insert your SIM card using the ejector tool.
      2. Power on, complete Android setup, and sign in to your Samsung account.
      3. Pull the S Pen from the bottom of the phone to take notes or annotate screenshots.

      ## S Pen
      - **Air Actions:** Hold the S Pen button and flick to switch camera lenses or advance slides.
      - **Screen Off Memo:** Remove the S Pen while the screen is off to jot a quick note.

      ## AI Features
      - **Circle to Search:** Press and hold the Home button, then draw a circle around anything on screen to search it.
      - **Live Translate:** Open the Phone app during a call and tap **Live Translate** to translate in real time.
    MD
    ["Samsung Galaxy S24+", "Apple iPhone 15 Pro Max", "Google Pixel 9 Pro XL", "OnePlus 12 Pro", "Xiaomi 14 Ultra", "Huawei Pura 70 Ultra", "Vivo X100 Ultra", "OPPO Find X7 Pro", "Asus ROG Phone 8 Ultimate", "Sony Xperia 1 VI", "Honor Magic6 Ultimate", "Nubia RedMagic 9 Pro+", "ZTE Axon 60 Ultra", "Motorola Moto G Power 5G 2024", "Google Pixel 9 Pro Fold", "OnePlus 12R", "Realme GT 6T"]
  ],
  [
    "Smartphones & Tablets",
    "Apple iPad Pro 13-inch M4",
    <<~MD,
      ## Setup
      1. Power on and follow the iPadOS setup wizard.
      2. Attach the Magic Keyboard Folio or Apple Pencil Pro via the front magnetic connector.
      3. Sign in with your Apple ID to restore apps and data from iCloud.

      ## Navigation
      - **Dock:** Slide up from the bottom for the Dock; continue sliding for the App Switcher.
      - **Stage Manager:** Tap the **⬜** icon in the Control Centre to arrange multiple overlapping windows.

      ## Apple Pencil Pro
      - Double-tap the flat edge to switch tools in supported apps.
      - Squeeze the Pencil to reveal the palette.
    MD
    ["Apple iPad Air 13-inch M2", "Samsung Galaxy Tab S9 Ultra", "Microsoft Surface Pro 10", "Lenovo Tab Extreme", "Google Pixel Tablet", "Xiaomi Pad 6 Pro", "Huawei MatePad Pro 13.2", "OPPO Pad 3 Pro", "Amazon Fire Max 11", "Asus ROG Flow Z13 2024", "Lenovo Tab P12 Pro", "Samsung Galaxy Tab S9 FE", "Nokia T21", "Realme Pad 2", "TCL NXTPAPER 14", "Blackview Tab 16 Pro", "Chuwi HiPad X Pro"]
  ],

  # ── Smartwatches & Wearables ─────────────────────────────────────────────────
  [
    "Smartwatches & Wearables",
    "Apple Watch Series 10",
    <<~MD,
      ## Pairing
      1. Hold the watch near your iPhone — the pairing prompt appears automatically.
      2. Point your iPhone camera at the watch's swirling animation to pair.
      3. Restore from a backup or set up as new.

      ## Daily Use
      - **Digital Crown:** Rotate to scroll; press to go Home; double-press for last app.
      - **Side Button:** Press for Control Centre; hold for Emergency SOS or Power Off.
      - **Siri:** Raise your wrist and say "Hey Siri", or press and hold the Digital Crown.

      ## Health
      - Wear the watch snug on your wrist — not too loose — for accurate heart rate and blood oxygen readings.
      - Enable **ECG** in the Health app on iPhone to record an electrocardiogram from the watch's Digital Crown.
    MD
    ["Apple Watch Ultra 2", "Samsung Galaxy Watch 7", "Google Pixel Watch 3", "Garmin Forerunner 965", "Fitbit Charge 6", "Garmin Venu 3", "Fossil Gen 6 Hybrid", "Withings ScanWatch 2", "Huawei Watch GT 4", "Amazfit GTR 4", "Mobvoi TicWatch Pro 5 Enduro", "Coros Apex 2", "Polar Pacer Pro", "Suunto Race", "Samsung Galaxy Watch FE", "OnePlus Watch 2", "Xiaomi Watch S3"]
  ],
  [
    "Smartwatches & Wearables",
    "Garmin Forerunner 965",
    <<~MD,
      ## Setup
      1. Press the **Light/Power** button to turn on.
      2. Download **Garmin Connect** on your phone and follow the pairing wizard.
      3. Set your profile details (age, weight, height) for accurate metrics.

      ## Starting a Run
      1. Go outside and press **GPS** — wait for the satellite signal icon to turn solid.
      2. Press **Start** (top-right button) to begin recording.
      3. Press **Lap** to mark splits; press **Stop** then **Save** to finish.

      ## Training Load & Recovery
      - Check the **Training Status** widget on the watch face for daily readiness.
      - **HRV Status** in Garmin Connect gives a 4-week sleep and recovery trend.
    MD
    ["Garmin Fenix 7 Pro", "Apple Watch Series 10", "Coros Pace 3", "Polar Vantage V3", "Suunto Race S", "Garmin Epix Pro Gen 2", "Suunto Vertical", "Coros Vertix 2S", "Polar Grit X2 Pro", "Casio Pro Trek WSD-F30", "Garmin Descent Mk3i", "Breitling Endurance Pro", "Tissot T-Touch Connect Solar", "Huawei Watch Ultimate", "Amazfit Falcon", "WHOOP 4.0", "Oura Ring Gen 3"]
  ],
  [
    "Smartwatches & Wearables",
    "Fitbit Charge 6",
    <<~MD,
      ## Getting Started
      1. Charge the band with the magnetic cable until the battery icon appears.
      2. Download the **Fitbit** app and create an account.
      3. Follow the in-app pairing instructions — enable Bluetooth on your phone.

      ## Daily Tracking
      - Wear on your non-dominant wrist, a finger's width above the wrist bone.
      - Swipe left/right on the display to cycle through steps, heart rate, sleep score, and stress.

      ## Workouts
      1. Swipe to **Exercise** and tap the activity type.
      2. Press the side button to start; press again to pause or end.
      3. View detailed stats in the Fitbit app after syncing.
    MD
    ["Fitbit Sense 2", "Garmin Vivosmart 5", "Samsung Galaxy Fit 3", "Xiaomi Smart Band 8 Pro", "Amazfit Band 7", "Huawei Band 8", "Honor Band 7", "Polar A370", "Withings Steel HR Sport", "Garmin Lily 2", "Misfit Shine 3", "Moov Now", "Jawbone UP3", "Sony SmartBand SWR12", "Bellabeat Leaf Urban", "Atlas Wristband 2", "Whoop 4.0 Band"]
  ],

  # ── Home Entertainment ───────────────────────────────────────────────────────
  [
    "Home Entertainment",
    "Samsung QN90D Neo QLED 65",
    <<~MD,
      ## Initial Setup
      1. Connect to power and attach the stand or wall-mount bracket.
      2. Press the power button on the remote or underside of the TV.
      3. Follow the SmartThings setup wizard: select language, connect to Wi-Fi, and sign in to your Samsung account.

      ## Remote Basics
      - **Home button:** Opens the Smart Hub app launcher.
      - **Ambient Mode button:** Displays artwork or information when the TV is idle.
      - **Microphone button:** Hold to speak commands — "Switch to HDMI 2", "Open Netflix".

      ## Picture Modes
      - Navigate to **Settings › Picture › Picture Mode** and choose **Filmmaker Mode** for accurate colours, or **Game Mode** for low-latency gaming.
    MD
    ["LG C4 OLED 65-inch", "Sony Bravia 7 65-inch", "Hisense U8N 65-inch", "TCL QM891G 65-inch", "Philips OLED908 65-inch", "Panasonic Z95A OLED 65-inch", "Sony Bravia 9 65-inch", "LG QNED99 65-inch", "Samsung S95D OLED 65-inch", "Hisense U7N 65-inch", "TCL C845 65-inch", "Bang & Olufsen Beovision Harmony 65", "Sharp AQUOS XLED 65-inch", "Vizio P-Series Quantum X 65-inch", "Toshiba M550 65-inch", "Grundig 65 GEU 7990 B", "Skyworth OLED 65S81"]
  ],
  [
    "Home Entertainment",
    "LG C4 OLED 65-inch",
    <<~MD,
      ## Setup
      1. Power on the TV and select your language.
      2. Connect to Wi-Fi; sign in or create an LG account for webOS services.
      3. Run **Auto Tuning** if using an aerial for live TV channels.

      ## webOS Navigation
      - Press **Home** on the magic remote to reveal the app bar.
      - Point the Magic Remote at the screen to use the on-screen pointer; press the scroll wheel to click.

      ## Gaming
      - Set the HDMI port to **4K @ 144 Hz** in **Settings › General › External Devices › HDMI Settings**.
      - Enable **VRR** and **G-Sync Compatible** for tear-free gaming.
    MD
    ["Samsung QN90D Neo QLED 65", "Sony A95L OLED 65-inch", "Philips OLED908 65-inch", "Panasonic Z95A OLED 65-inch", "Hisense A85H OLED 65-inch", "LG G4 OLED 65-inch", "Sony Bravia 9 65-inch", "Samsung S95D OLED 65-inch", "TCL C845 65-inch", "Hisense U8N 65-inch", "Sharp 4T-C65FQ1X", "Vizio OLED55-H1", "Skyworth OLED65S81", "Metz MOB-55Z7790", "Bang & Olufsen Beovision Contour 55", "Loewe bild i.65", "Grundig OLED 65-inch"]
  ],
  [
    "Home Entertainment",
    "Apple TV 4K 3rd Gen",
    <<~MD,
      ## Setup
      1. Connect the Apple TV to your TV via HDMI and to power.
      2. On your iPhone, hold it near the Apple TV — setup transfers Wi-Fi and Apple ID automatically.
      3. Sign in to the App Store to download streaming apps.

      ## Siri Remote
      - **Click pad:** Swipe to navigate; click the centre to select.
      - **Back button:** Single press goes back; press and hold returns to the Home Screen.
      - **Power button:** Single press to sleep/wake; press and hold to access power options for your TV.

      ## AirPlay
      - Mirror your iPhone or Mac by tapping the **Screen Mirror** icon in Control Centre, then select your Apple TV.
    MD
    ["Roku Ultra 4K", "Amazon Fire TV Stick 4K Max", "Google Chromecast with Google TV 4K", "Nvidia Shield TV Pro", "TiVo Stream 4K", "Xiaomi Mi Box S 2nd Gen", "Mecool KM7 Plus", "Amazon Fire TV Cube 3rd Gen", "Roku Streaming Stick 4K 2023", "Walmart onn. 4K Pro Streaming Device", "Google TV Streamer 4K", "Amazon Fire TV Stick 4K 2023", "Ugoos AM6B Plus", "Beelink GT King II", "Formuler Z Alpha", "ZIDOO Z9X Pro", "Dune HD Pro 4K II"]
  ],

  # ── Kitchen Appliances ───────────────────────────────────────────────────────
  [
    "Kitchen Appliances",
    "Breville BOV900BSS Breville Smart Oven Air Fryer Pro",
    <<~MD,
      ## Getting Started
      1. Remove all packaging and place the oven on a heat-resistant surface with 4 inches clearance on all sides.
      2. Wipe the interior with a damp cloth; run a 30-minute **Bake** cycle at 400 °F to burn off residue.
      3. Select a function with the **Function** dial; set time and temperature; press **Start**.

      ## Key Functions
      - **Air Fry:** Use the included mesh basket; 400 °F for 15–20 min gives crispy results.
      - **Proof:** Maintains low heat (80–100 °F) for rising bread dough.
      - **Slow Cook:** Set to 275 °F for 6–8 hours for stews and braises.

      ## Cleaning
      - Let cool completely before cleaning.
      - Remove and wash the crumb tray, wire rack, and basket in warm soapy water.
      - Wipe the interior with a damp cloth — do not use abrasive scrubbers.
    MD
    ["Cuisinart TOA-70 AirFryer Toaster Oven", "Ninja Foodi XL SP351", "KitchenAid KCO300SS", "Instant Pot Omni Plus", "Cosori Smart Air Fryer Toaster Oven", "Breville Smart Oven Air Fryer Pro BOV900BSS", "Panasonic FlashXpress NB-G110P", "Hamilton Beach Sure-Crisp 31190", "Black+Decker TO3250XSB", "Oster TSSTTVMNDG-SHP", "GE Large Capacity Smart Toaster Oven JKS10DPBB", "Cuisinart TOB-60N1", "Tovala Gen 2 Smart Oven", "June Oven 3rd Gen", "Brava Home", "Suvie Kitchen Robot", "Miele H 7164 B"]
  ],
  [
    "Kitchen Appliances",
    "Instant Pot Duo 7-in-1 8qt",
    <<~MD,
      ## Before First Use
      1. Wash the inner pot, lid, and sealing ring with warm soapy water.
      2. Perform a water test: add 3 cups of water, seal the lid, and run **Steam** for 2 minutes.

      ## Pressure Cooking
      1. Add ingredients and liquid (minimum 1 cup).
      2. Lock the lid — align the arrow on the lid with the lock icon on the base and turn.
      3. Set the **Sealing** valve to **Sealing**.
      4. Press **Pressure Cook**, set the time, and press **Start**.
      5. Release pressure: turn the valve to **Venting** for Quick Release, or leave it for Natural Release.

      ## Sauté Mode
      - Press **Sauté** and let the pot heat for 3 minutes before adding oil and ingredients.
      - Press **Cancel** when done to stop sautéing.
    MD
    ["Instant Pot Pro 8qt", "Ninja Foodi 8qt OL701", "Breville Fast Slow Pro BPR700", "Cuisinart CPC-800", "Cosori 6Qt Electric Pressure Cooker", "Zavor Lux Multi-Cooker 8qt", "Presto 01784 23-Qt Pressure Canner", "Fissler Vitaquick 8.5qt", "WMF Perfect Plus 6.5L", "Kuhn Rikon Duromatic 5L", "Fagor LUX Multi Cooker 6qt", "All-American 921 21.5qt", "T-fal Clipso Stainless Steel 6.3qt", "Hawkins Futura 5L", "Power Pressure Cooker XL PPC770", "Carey DPC-9SS Smart Pressure Canner", "Ninja Speedi SF301"]
  ],
  [
    "Kitchen Appliances",
    "Nespresso Vertuo Next",
    <<~MD,
      ## Setup
      1. Fill the 37 oz water tank and attach it to the back.
      2. Press the button to power on; the machine blinks orange while heating.
      3. Run two cleaning cycles (press button three times rapidly) before first use.

      ## Brewing
      1. Insert a Vertuo capsule — the barcode is read automatically.
      2. Close the lever and press the button once.
      3. The machine brews and stops automatically when done.

      ## Descaling (every 3 months)
      1. Enter descaling mode (hold button 7 seconds until orange light blinks).
      2. Add descaling solution and 0.5 L of water.
      3. Follow the two-cycle process; rinse with fresh water when complete.
    MD
    ["Nespresso Vertuo Pop", "Nespresso Vertuo Creatista Plus", "De'Longhi Magnifica Evo", "Breville Barista Express BES870XL", "Keurig K-Supreme Plus", "Gaggia Classic Pro", "Rancilio Silvia Pro X", "De'Longhi La Specialista Arte EC9155MB", "Jura E8 Piano Black", "Saeco PicoBaristo SM5570/10", "Nuova Simonelli Musica", "ECM Synchronika", "Rocket Appartamento", "Lelit Bianca PL162T", "DeLonghi Dinamica Plus ECAM370.85.SB", "Miele CM5300", "Nespresso Creatista Plus SNE800BSS"]
  ],

  # ── Home Comfort Devices ─────────────────────────────────────────────────────
  [
    "Home Comfort Devices",
    "Dyson Purifier Hot+Cool HP07",
    <<~MD,
      ## Setup
      1. Place on a flat surface away from walls and obstructions.
      2. Download the **Dyson Link** app and create an account.
      3. Follow the in-app Wi-Fi setup to connect the purifier.

      ## Operating
      - **Power:** Press the standby button on the remote or the app.
      - **Fan Speed:** Adjust with the up/down arrows (1–10).
      - **Auto Mode:** Press **Auto** — the purifier adjusts speed based on air quality sensors.
      - **Heat:** Press the **Heat** button; use the temperature arrows to set target (°C or °F).

      ## Filter Replacement
      - The app notifies you when filters need replacing (approximately every 12 months).
      - Remove the outer loop amplifier, press the filter tabs to release, and swap in the new HEPA+carbon filter.
    MD
    ["Dyson Purifier Cool Formaldehyde TP09", "Coway AP-1512HH Mighty", "Levoit Core 400S", "Blueair Blue Pure 311i Max", "Winix 5500-2", "Molekule Air Pro", "Austin Air HealthMate HM-400", "IQAir HealthPro Plus", "Rabbit Air MinusA2", "Alen BreatheSmart 75i", "Honeywell HPA300", "Sharp FP-A80UW", "Philips AC3033/10", "Bissell air220 2780A", "Hathaspace HSP001", "Medify MA-112", "Airdog X5"]
  ],
  [
    "Home Comfort Devices",
    "Nest Learning Thermostat 4th Gen",
    <<~MD,
      ## Installation
      1. Turn off power to your HVAC system at the breaker.
      2. Remove the old thermostat and photograph the wiring.
      3. Use the Nest app or the in-box guide to match wires to the correct Nest terminals.
      4. Snap the thermostat onto the base; restore power.

      ## Programming
      - **Manual:** Rotate the outer ring to set temperature; press to confirm.
      - **Schedule:** The Nest learns your preferences after about a week and auto-programs.
      - **Eco Mode:** Press the ring, scroll to **Eco**, and press — it uses a wider temperature range to save energy.

      ## App Control
      - Open **Google Home** to adjust temperature, view energy history, or enable **Home/Away Assist**.
    MD
    ["Nest Thermostat E", "Ecobee SmartThermostat Premium", "Honeywell Home T9", "Emerson Sensi Touch 2", "Amazon Smart Thermostat", "Johnson Controls GLAS Smart Thermostat", "Lux KONOz Wi-Fi Thermostat", "Vine Smart Home Thermostat KS-602", "Radio Thermostat CT50", "Mysa Smart Thermostat", "Sinopé TH1123ZB", "2GIG CT100 Z-Wave Thermostat", "Centralite Pearl Thermostat 3156105", "Alarm.com ADC-T3000 Thermostat", "Bosch BCC100", "Stelpro STZW402WB+", "Daikin BRP069B45"]
  ],

  # ── Cleaning Appliances ──────────────────────────────────────────────────────
  [
    "Cleaning Appliances",
    "Dyson V15 Detect Absolute",
    <<~MD,
      ## Getting Started
      1. Charge fully (4.5 hours) before first use.
      2. Attach the appropriate head — Torque Drive for carpet, Fluffy for hard floors.
      3. Press and hold the trigger to start; release to stop (preserves battery).

      ## Modes
      - **Auto:** The suction adjusts automatically based on debris detected by the laser and piezo sensor.
      - **Boost:** Press the **+** button for maximum suction on stubborn dirt.

      ## Emptying the Bin
      1. Hold the vacuum over a bin.
      2. Pull the red slider down firmly — the bin base opens and deposits debris.
      3. Wipe the interior cyclone mesh with a dry cloth if clogged.

      ## Filter Cleaning
      - Remove the purple filter at the top; rinse under cold water only; air-dry 24 hours before reinserting.
    MD
    ["Dyson V12 Detect Slim", "Samsung Bespoke Jet Complete", "Shark Stratos IZ862H", "Miele Triflex HX2 Pro", "LG CordZero A9 Kompressor", "Hoover ONEPWR Evolve Pet ANS Max BH53620", "Tineco Floor One S7 Pro", "Bissell MultiReach Ion XL 36V 29399", "Black+Decker PowerSeries Extreme BCV36BTP", "Rowenta X-Force Flex 14.60", "Electrolux WellQ7 Animal", "Philips SpeedPro Max Aqua FC6904", "Bosch Unlimited 8 BCS82POW", "Grundig VCP 6830", "AEG RapidClean Pro LF82-6BC", "Dreame T30 Neo", "Roborock H13 Pro"]
  ],
  [
    "Cleaning Appliances",
    "iRobot Roomba j9+",
    <<~MD,
      ## Setup
      1. Place the Clean Base on a hard floor near a power outlet with 1.5 ft clearance on each side.
      2. Charge Roomba in the base for 3 hours.
      3. Download the **iRobot Home** app, create an account, and follow the Wi-Fi pairing steps.

      ## Running a Clean
      - **Quick Clean:** Press the **Clean** button on the robot.
      - **Scheduled Clean:** In the app, tap **Schedule** and set daily or weekly times.
      - **Zone Clean:** Draw a specific room or zone in the app map.

      ## Maintenance
      - **Bin:** The Clean Base auto-empties after each run; replace the AllergenLock bag every 60 days.
      - **Brushes:** Remove and cut away hair tangles weekly.
      - **Filter:** Replace every 2 months.
    MD
    ["iRobot Roomba Combo j9+", "Roborock S8 MaxV Ultra", "Ecovacs Deebot X2 Omni", "Dreame X40 Ultra", "Narwal Freo X Ultra", "Shark IQ Robot XL RV1001AE", "Eufy RoboVac X9 Pro", "Samsung JetBot AI+ VR50T95735W", "Neato D10 Intelligent Robot Vacuum", "Bissell SpinWave 2-in-1 3115", "Yeedi Cube 2-in-1", "Viomi S9 UV", "Proscenic M8 Pro", "Lubluelu SL60D", "Ultenic T10 Combo", "Mamnv MOP M100", "ILIFE V80 Max"]
  ],

  # ── Smart Home Gadgets ───────────────────────────────────────────────────────
  [
    "Smart Home Gadgets",
    "Amazon Echo Show 10 3rd Gen",
    <<~MD,
      ## Setup
      1. Plug in the Echo Show and follow the on-screen Alexa app pairing instructions.
      2. Sign in with your Amazon account.
      3. Connect to Wi-Fi and complete the setup wizard.

      ## Using Alexa
      - Say **"Alexa"** followed by a command: "Alexa, turn off the kitchen lights."
      - **Swipe down** from the top for the Control Panel (Wi-Fi, Do Not Disturb, Settings).
      - **Swipe up** from the bottom for the home screen widgets.

      ## Motion Tracking
      - The 10-inch screen automatically rotates to follow you while you cook or move around the room.
      - Disable in **Settings › Device Options › Motion**.

      ## Video Calls
      - Say "Alexa, video call [contact name]" to start a call to another Echo device or the Alexa app.
    MD
    ["Amazon Echo Show 8 3rd Gen", "Google Nest Hub Max 2nd Gen", "Apple HomePod mini", "Meta Portal Go", "Facebook Portal TV", "Amazon Echo Show 5 3rd Gen", "Google Nest Hub 2nd Gen", "Lenovo Smart Display 10 ZA840000US", "JBL Link View GA", "Harman Kardon Allure Voice", "Sonos Era 100", "Bang & Olufsen Beosound Balance", "Amazon Echo Hub", "Samsung SmartThings Hub v3", "Wink Hub 2", "Hubitat Elevation Model C-8", "HomeKit Homepod 2nd Gen"]
  ],
  [
    "Smart Home Gadgets",
    "Philips Hue Starter Kit A19",
    <<~MD,
      ## Hardware Setup
      1. Screw Hue bulbs into standard E26 lamp sockets.
      2. Connect the Hue Bridge to your router via Ethernet and to power.
      3. Wait for all three lights on the Bridge to turn solid.

      ## App Setup
      1. Download **Philips Hue** app; tap **Set up** and follow the pairing wizard.
      2. Name each bulb by room for easy control.

      ## Controlling Lights
      - **App:** Tap a room to toggle; drag the brightness/colour wheel to adjust.
      - **Voice:** "Alexa/Hey Google, set the living room to 50 % brightness."
      - **Automations:** Schedule lights to turn on at sunset or when you arrive home.
    MD
    ["Philips Hue Gradient Lightstrip 80-inch", "LIFX A19 1100 lm", "Nanoleaf Essentials A19", "Govee Smart Bulb H6003", "Sengled Smart LED A19", "TP-Link Kasa Smart Bulb KL130", "Yeelight Smart Bulb M2 YLDP25YL", "Wiz A21 Color BR30", "Eufy Lumos Smart Bulb T1012", "Sylvania Smart+ ZigBee A19", "GE Cync Full Color A19", "Amazon Basics Smart A19 Color", "Ring PAR38 Outdoor Smart LED", "Hive Active Light E27 Color", "Osram Smart+ Classic A RGBW", "Ikea Tradfri LED Bulb E27 806 Lumen", "Tuya Smart Life RGB Bulb"]
  ],

  # ── Office Equipment ─────────────────────────────────────────────────────────
  [
    "Office Equipment",
    "HP LaserJet Pro 4001dw",
    <<~MD,
      ## Setup
      1. Remove all packing tape and protective inserts, then install the toner cartridge.
      2. Connect to power and press the power button.
      3. On the printer's touchscreen, select your language and connect to Wi-Fi.
      4. On your computer, go to **hp.com/support** to download and run the full driver package.

      ## Printing
      - **Windows:** Press **Ctrl + P**, select the printer, and click **Print**.
      - **Mac:** Press **⌘ + P**, select the printer from the drop-down.
      - **Mobile:** Use the **HP Smart** app or AirPrint (iOS) / Mopria (Android).

      ## Two-Sided Printing
      - Select **Print on Both Sides** in the print dialog (enabled by default on this model).

      ## Toner Replacement
      1. Open the front door.
      2. Pull out the cartridge by its handle.
      3. Shake the new cartridge gently, remove packaging, and slide it in until it clicks.
    MD
    ["Brother HL-L3300CDW", "Canon imageCLASS MF753Cdw", "Epson EcoTank ET-4850", "Xerox C315", "Lexmark MC3426adw", "OKI C532dn", "Kyocera ECOSYS M5526cdn", "Ricoh SP C342DN", "Konica Minolta bizhub C250i", "Sharp MX-C304W", "Xerox VersaLink C405DN", "HP LaserJet Enterprise MFP M635h", "Canon imageRUNNER ADVANCE DX C3730i", "Dell H625cdw", "Samsung CLX-6260FW", "Pantum CM7105DN", "Olivetti d-Color MF2626"]
  ],
  [
    "Office Equipment",
    "Logitech MX Master 3S",
    <<~MD,
      ## Setup
      1. Turn on the mouse using the switch on the underside.
      2. **USB Receiver:** Plug the Logi Bolt USB receiver into your computer — the mouse pairs automatically.
      3. **Bluetooth:** Press the Easy-Switch button on the bottom, hold until the LED blinks, and pair in your OS Bluetooth settings.

      ## Features
      - **MagSpeed Wheel:** Flick the scroll wheel fast to switch from click-to-click to free-spin mode automatically.
      - **Horizontal Scroll:** Tilt the scroll wheel left or right.
      - **App-Specific Settings:** Install **Logi Options+** to assign custom actions per application to every button.

      ## Multi-Device Use
      - The mouse supports up to 3 devices; press the Easy-Switch button to cycle between them.
    MD
    ["Logitech MX Anywhere 3S", "Apple Magic Mouse 2", "Microsoft Arc Mouse", "Razer Pro Click V2", "Kensington Pro Fit Ergo Wireless", "SteelSeries Rival 650 Wireless", "Corsair Dark Core RGB Pro SE", "HyperX Pulsefire Haste 2 Wireless", "Asus ROG Gladius III Wireless", "Zowie EC2-CW Wireless", "Glorious Model O Wireless", "Endgame Gear XM2WE", "Ninjutso Origin One X Wireless", "Pulsar Xlite V3 Wireless", "Lamzu Thorn 4K Wireless", "Roccat Kone Pro Air", "Trust GXT 923 Ybar+"]
  ],

  # ── Networking Gear ──────────────────────────────────────────────────────────
  [
    "Networking Gear",
    "Eero Pro 6E 3-Pack",
    <<~MD,
      ## Setup
      1. Download the **Eero** app and create or log in to your Amazon/Eero account.
      2. Plug one Eero Pro into your modem via Ethernet; plug it into power.
      3. Follow in-app instructions to scan the QR code on the bottom of the unit.
      4. Add the remaining two Eero units — place them in areas with weak signal; plug in and scan each.

      ## Managing Your Network
      - **Pause Wi-Fi:** Tap a device in the app and press **Pause** (useful for kids' devices).
      - **Speed Test:** Run from the app's Network tab to test real-world throughput.
      - **Profiles:** Group family members' devices and set content filters or schedules per profile.

      ## Tips
      - Place nodes so each is no more than 40 ft from the nearest neighbour.
      - Use the 6 GHz band (if supported by your devices) for highest speeds.
    MD
    ["Google Nest WiFi Pro 6E 3-Pack", "TP-Link Deco XE75 Pro 3-Pack", "Netgear Orbi RBK863S", "Asus ZenWiFi Pro ET12", "Linksys Velop MX5300 3-Pack", "Ubiquiti UniFi Dream Machine Special Edition", "Amplifi Alien AFI-ALN-R", "D-Link Covr X1872", "Tenda MX12 Pro 3-Pack", "Mercusys Halo H70X 3-Pack", "ZTE MC801A 5G Router", "Nokia Wi-Fi Beacon 6 3-Pack", "Netgear Orbi 960 RBK963S", "TP-Link Deco BE95 2-Pack", "Huawei WiFi Mesh 7 3-Pack", "GL.iNet GL-MT6000 Flint 2", "Asus ZenWiFi BQ16 Pro"]
  ],
  [
    "Networking Gear",
    "TP-Link Archer BE800",
    <<~MD,
      ## Hardware Setup
      1. Connect the WAN port to your modem with the included Ethernet cable.
      2. Plug into power and wait for the LED to turn solid amber, then white.
      3. Connect a device to the default Wi-Fi network (printed on the label) or via Ethernet.

      ## Web Interface Setup
      1. Open a browser and go to **tplinkwifi.net** or **192.168.0.1**.
      2. Create an admin password and run the Quick Setup wizard to configure your Internet connection type (usually DHCP).

      ## Optimisation
      - Enable **Airtime Fairness** in Wireless settings to prevent slow devices from hogging bandwidth.
      - Use **QoS** (Bandwidth Control) to prioritise gaming or video-conference traffic.
    MD
    ["TP-Link Archer AXE300", "Asus RT-BE96U", "Netgear Nighthawk RS700S", "Linksys Hydra Pro 6E", "D-Link AQUILA PRO AI M60", "Netgear Nighthawk RAX120", "TP-Link Archer BE900", "Asus RT-AX86U Pro", "Linksys MR9600", "D-Link DIR-X5460", "Xiaomi AX9000", "GL.iNet GL-AXT1800 Slate AX", "Cudy WR3000", "Tenda RX9 Pro", "ZTE AX5400 Pro+", "Mercusys MR90X", "Comtrend VR-3060"]
  ],

  # ── Health & Fitness Devices ─────────────────────────────────────────────────
  [
    "Health & Fitness Devices",
    "Garmin Fenix 7 Pro Solar",
    <<~MD,
      ## Setup
      1. Charge the watch with the included clip charger.
      2. Download **Garmin Connect** and follow the Bluetooth pairing wizard.
      3. Enter your personal profile (age, weight, VO2 max or run a suggested test).

      ## Starting an Activity
      1. Press **GPS** (top-left button) to open the activity list.
      2. Scroll to your sport and press **Start**.
      3. Wait for GPS fix — the screen shows a satellite icon; solid = ready.
      4. Press **Start** again to begin recording.

      ## Solar Charging
      - The bezel continuously harvests sunlight to extend battery life.
      - Display the **Solar Intensity** widget to see how much charge the sun is adding.

      ## Recovery
      - Check **Body Battery** and **HRV Status** each morning — green means ready to train hard.
    MD
    ["Garmin Forerunner 965", "Coros Apex 2 Pro", "Suunto Vertical", "Polar Vantage V3", "Apple Watch Ultra 2", "Garmin Forerunner 165", "Garmin Instinct 2X Solar", "Polar Pacer Pro", "Coros Pace 3", "Suunto Race S", "Amazfit T-Rex 3", "Huawei Watch GT 4 46mm", "Mobvoi TicWatch Pro 5", "Casio GBD-H2000", "Withings ScanWatch Horizon", "Epson ProSense 307", "Timex Ironman R300 GPS"]
  ],
  [
    "Health & Fitness Devices",
    "Theragun Pro Gen 6",
    <<~MD,
      ## Getting Started
      1. Charge with the magnetic charging cable until the LED ring is solid white.
      2. Attach the desired attachment head (dampener for sensitive areas, ball for large muscles).
      3. Press the power button once to turn on; press again to cycle speeds (1750–2400 RPM).

      ## Usage
      - Float the device over the skin — let the device do the work; do not press hard.
      - Spend 1–2 minutes per muscle group.
      - Use the **Therabody** app for guided routines based on your sport or recovery need.

      ## Tips
      - Avoid bony areas, the spine, and the head/neck.
      - Use the **Micro-Point** attachment for plantar fascia relief.
    MD
    ["Theragun Elite Gen 6", "Hypervolt 2 Pro", "Ekrin B37", "Renpho R3 Mini", "Achedaway Pro", "Hyperice Hypervolt Go 2", "TimTam All New Power Massager Pro", "Opove Apex Pro", "Bob and Brad D6 Pro", "Vybe Pro Percussion Massage Gun", "LifePro Sonic Handheld Percussion Massager", "Compex Fixx 2.0", "Wahl Deep Tissue Percussion Massager 4290-300", "Tao Tronics TT-PCA001", "Sportneer Elite D9", "Legiral Le3 Pro", "MuscleGun Carbon"]
  ],

  # ── Medical Equipment ────────────────────────────────────────────────────────
  [
    "Medical Equipment",
    "Omron Platinum Blood Pressure Monitor BP5450",
    <<~MD,
      ## Preparation
      1. Sit quietly for 5 minutes before measuring.
      2. Sit upright, feet flat on the floor, arm resting at heart level.
      3. Wrap the cuff around your bare upper arm, 1–2 cm above the elbow.

      ## Taking a Reading
      1. Press the **Start/Stop** button — the cuff inflates automatically.
      2. Stay still and silent until the reading appears on screen.
      3. The monitor displays systolic, diastolic, and pulse; an irregular heartbeat indicator shows if arrhythmia is detected.

      ## Storing Results
      - The device stores up to 200 readings per user (2 users supported).
      - Connect via Bluetooth to the **Omron Connect** app to track trends over time.

      > **Note:** This device is for general wellness monitoring. Consult your doctor to interpret results.
    MD
    ["Withings BPM Connect", "Beurer BM 54", "A&D Medical UA-651BLE", "Qardio Arm", "iHealth Track KN-550BT", "FORA Test N' Go Advanced Wireless Upper Arm BP P30 Plus", "Panasonic EW3109W", "Citizen CH-650F", "Microlife BP A6 PC", "Rite Aid Deluxe Automatic Blood Pressure Monitor", "Greater Goods Balance Upper Arm Digital Blood Pressure Monitor", "Welch Allyn Home H-BP100SBP", "Braun ExactFit 5 BP6200", "Thermo Fisher Life Sciences AMP300A", "Everlast Heart Rate Monitor HRM-2511", "Transtek TM-2657P", "Wellue O2Ring Blood Oxygen Monitor"]
  ],
  [
    "Medical Equipment",
    "ResMed AirSense 11 AutoSet CPAP",
    <<~MD,
      ## Setup
      1. Place the machine on a firm, flat surface beside your bed.
      2. Fill the HumidAir water chamber to the MAX line with distilled water only.
      3. Connect the heated tubing (ClimateLineAir) to the machine and to your mask.
      4. Fit your mask per the manufacturer's fitting guide and lie down.

      ## Starting Therapy
      1. Press **Start** — air flows automatically.
      2. The machine ramps up pressure over a period set by your clinician.
      3. Press **Stop** when you wake or remove your mask.

      ## myAir App
      - Pair via Wi-Fi; the machine uploads nightly data automatically.
      - The app shows your AHI (apnoea events per hour), mask seal score, and usage hours.

      > **Important:** Settings and therapy prescriptions must be configured by a licensed sleep therapist or physician.
    MD
    ["Philips DreamStation 2 Auto CPAP", "Fisher & Paykel SleepStyle Auto", "Lowenstein Prisma Smart Max", "ResMed AirMini", "DeVilbiss IntelliPAP 2", "Transcend Auto miniCPAP EZEX", "HDM Z1 Auto Travel CPAP", "Breas Z2 Auto Travel CPAP", "Apex Medical XT Fit", "Somnetics Transcend 3 Auto", "BMC RESmart Auto", "Luna II Auto CPAP by 3B Medical", "Lowenstein Medical Prisma SOFT", "Nox T3s Portable Sleep Monitor", "WatchPAT One", "Itamar Medical WatchPAT 300", "Contec SleepSat CMS50F"]
  ],

  # ── Automotive Tech ──────────────────────────────────────────────────────────
  [
    "Automotive Tech",
    "Garmin DriveSmart 76",
    <<~MD,
      ## First Use
      1. Mount the unit on the windshield using the suction cup — ensure a firm seal.
      2. Connect to the vehicle power adapter; the device powers on automatically.
      3. Complete the setup wizard (language, units, home address).

      ## Navigation
      1. Tap the **Search** icon and enter a destination.
      2. Review the route options and tap **Go**.
      3. Follow voice and on-screen turn-by-turn prompts.

      ## Live Services (via smartphone)
      - Pair with the **Garmin Drive** app for live traffic, speed camera alerts, and weather.
      - Bluetooth phone calls: pair in **Settings › Bluetooth › Phone** to take calls hands-free.

      ## Map Updates
      - Connect to Wi-Fi or a computer with **Garmin Express** to download free lifetime map updates.
    MD
    ["Garmin DriveSmart 86", "TomTom GO Expert Plus 7", "Rand McNally RVND 7720 LM", "Sygic GPS Truck Navigation", "Magellan RoadMate 6630T-LM", "Garmin RV 1095 GPS Navigator", "Garmin DriveSmart 76", "TomTom GO Camper Tour", "Navman MY670LMT", "Pioneer SPH-DA360DAB", "Kenwood DNX997XR", "Alpine iLX-507", "Sony XAV-AX8050D", "JVC KW-M785DBW", "Clarion NX706AU", "Blaupunkt Las Vegas 990", "Cobra 8000 PRO HD Dash Cam GPS"]
  ],
  [
    "Automotive Tech",
    "Vantrue E1 Lite Dash Cam",
    <<~MD,
      ## Installation
      1. Insert a MicroSD card (64 GB–512 GB, Class 10 or U3).
      2. Mount on the windshield behind the rearview mirror using the 3M adhesive pad.
      3. Route the cable along the headliner and A-pillar to the 12 V socket.

      ## Recording
      - The camera starts recording automatically when the car powers on.
      - Files are saved in 1-, 3-, or 5-minute segments; old files overwrite automatically (loop recording).

      ## Incident Detection
      - **G-Sensor:** If a collision is detected, the current clip is locked from overwriting.
      - **Parking Mode:** With a hardwire kit installed, the camera records motion while parked.

      ## Reviewing Footage
      - Remove the SD card and read it on a computer, or use the **Vantrue** app via Wi-Fi.
    MD
    ["Vantrue N4 Pro", "Nextbase 622GW", "Garmin Dash Cam 67W", "Thinkware U1000", "Blackvue DR970X-2CH", "Viofo A129 Pro Duo", "Cobra SC 201", "Kenwood DRV-A601W", "Rexing V1P Pro Max", "Apeman C880", "Nextbase 422GW", "Vantrue E1 Lite", "Garmin Dash Cam 57", "Thinkware F200 Pro", "BlackVue DR590X-2CH", "Viofo A119 Mini 2", "Scosche NEXS1"]
  ],

  # ── Outdoor & Garden Tools ───────────────────────────────────────────────────
  [
    "Outdoor & Garden Tools",
    "Husqvarna Automower 450X NERA",
    <<~MD,
      ## Installation
      1. Install the guide wire and boundary wire around the perimeter and any exclusion zones per the installation guide.
      2. Place the charging station on a flat spot with good sun protection.
      3. Run the initial GPS-assisted mapping session from the Automower Connect app.

      ## Daily Operation
      - Set a mowing schedule in the **Husqvarna Automower Connect** app.
      - The mower navigates autonomously, returns to charge automatically, and resumes.

      ## Maintenance
      - **Blades:** Inspect weekly; replace the three razor blades when worn (use a Torx T15 key).
      - **Cleaning:** Rinse the underside with a garden hose (not a pressure washer).
      - **Winter Storage:** Lift, clean, store in a dry place, and leave on the charging station.

      ## Safety
      - Lift handle stops blades immediately.
      - PIN-protected — the mower is immobilised if stolen.
    MD
    ["Husqvarna Automower 310E", "Gardena Sileno Life 750", "EcoFlow Blade", "Worx Landroid Vision M700", "Robomow RX12u", "Bosch Indego S+ 500", "Honda Miimo 3000i", "Stiga Autoclip 723 S", "John Deere Tango E5 Series II", "Stihl iMOW RMI 422 P", "AL-KO Robolinho 4100 W", "Belrobotics Bigmow Connected", "Viking iMow MI 632 C", "Mountfield Robomow RX20 M", "McCulloch ROB 1000", "Flymo EasiLife 200 GO", "Greenworks Optimow 15"]
  ],
  [
    "Outdoor & Garden Tools",
    "Ego Power+ LM2156SP",
    <<~MD,
      ## Setup
      1. Insert the 56 V 7.5 Ah battery until it clicks; charge beforehand if needed.
      2. Unfold the handle by releasing both side levers.
      3. Adjust cutting height by moving the lever beside the rear wheel (6 positions: 1.5–4 in).

      ## Mowing
      1. Stand behind the mower; squeeze and hold both bail handles.
      2. Press the **Start** button — the blade spins within 1 second.
      3. Release either bail handle to stop immediately.

      ## Self-Propel
      - Press the **Speed +/−** buttons on the handle to set drive speed.
      - Squeeze the propulsion lever on the left handle to engage.

      ## Battery Care
      - Store batteries in a cool, dry place at 40–80 % charge for extended periods.
    MD
    ["Ego Power+ LM2135SP", "Greenworks 82V 21-inch Pro", "Milwaukee M18 FUEL 21-inch", "Ryobi 40V HP 21-inch", "Makita 40V MAX 21-inch", "Toro Recycler 60V Max 21-inch 21357", "Kobalt 80V Max 21-inch KM2180B-06", "DeWalt DCMW220P2 20V MAX 21-inch", "Snapper XD 82V 21-inch SXDWM82K", "Worx WG743 40V 14-inch", "Sun Joe MJ401E-XR 17-inch", "Craftsman CMCMW260P1 20V 21-inch", "Hart 40V 20-inch Brushless HLPM033VNM", "Black+Decker CM2040 40V 20-inch", "Husqvarna Aspire LE322i 22-inch", "Bosch CityMower 18-inch 06008B9A70", "Stiga Collector 548 SW 48V"]
  ],

  # ── DIY & Power Tools ────────────────────────────────────────────────────────
  [
    "DIY & Power Tools",
    "DeWalt DCD999B 20V MAX Brushless Drill",
    <<~MD,
      ## Safety First
      - Wear safety glasses and appropriate clothing.
      - Inspect the bit for damage before use.
      - Ensure the battery is fully seated before operating.

      ## Basic Drilling
      1. Insert the correct bit into the chuck; tighten by rotating the chuck collar clockwise.
      2. Set the clutch ring to the appropriate torque setting (lower = lighter materials, higher = wood/metal).
      3. Press the forward/reverse button to select direction.
      4. Squeeze the trigger — speed is variable with trigger pressure.

      ## Hammer Drill Mode
      - Rotate the mode selector to the hammer drill icon for masonry work.
      - Use a masonry bit; let the bit do the work — avoid excessive pressure.

      ## Battery Tips
      - Charge with a 20V MAX charger; FLEXVOLT chargers also work.
      - Store batteries at room temperature.
    MD
    ["DeWalt DCD800B 20V MAX", "Milwaukee 2804-20 M18 FUEL", "Makita XFD15Z 18V LXT", "Bosch GSR18V-535B12", "Ryobi PCL206K1 18V", "Ridgid R86116K 18V", "Hilti SF 6H-A22 22V", "Metabo BS 18 LT BL", "Festool T 18+3-Basic 574749", "Snap-on CDRS761A 18V", "Panasonic EY74A2 14.4V/18V", "Hitachi DS18DCL2 18V", "Ingersoll Rand W1130-K12 12V", "Porter-Cable PCC641LB 20V MAX", "Flex FX1141T-2B 24V", "Mac Tools BWP151 12V", "Craftsman CMCD700C1 20V MAX"]
  ],
  [
    "DIY & Power Tools",
    "Milwaukee 2787-20 M18 FUEL Circular Saw",
    <<~MD,
      ## Safety
      - Wear safety glasses, hearing protection, and a dust mask.
      - Ensure the blade guard returns freely after each cut.
      - Keep hands away from the blade path; use clamps to secure workpieces.

      ## Setup
      1. Insert and lock an M18 battery.
      2. To change blades: press the spindle lock and loosen the bolt with the included wrench (left-hand thread).
      3. Adjust bevel angle (0°–56°) by loosening the bevel lock and tilting the shoe.
      4. Set cut depth: loosen the depth lever, drop the shoe to the desired depth, re-tighten.

      ## Cutting
      1. Align the blade with your cut line; the left-side blade kerf indicator assists.
      2. Press the safety button, then squeeze the trigger.
      3. Feed the saw forward steadily — avoid forcing.
    MD
    ["Milwaukee 2730-20 M18 FUEL 6-1/2 in.", "DeWalt DCS573B 7-1/4 in.", "Makita XSH08Z 7-1/4 in.", "Bosch GKS18V-25GCN", "Skilsaw SPT67WL-01", "Ryobi PCL540B 18V ONE+ 7-1/4 in.", "Ridgid R8652K 18V 7-1/4 in.", "Metabo KS 18 LTX 66 BL", "Festool HK 55 EBQ-Plus", "Hilti SCO 22-A Cordless", "Mafell KSS 60 18M bl", "Flex FX2141T-Z 24V", "AEG BSS18BL-0 18V", "Einhell TE-CS 18/190 Li BL 18V", "Worx WX530L 20V", "Makita XSH06Z 18V LXT", "Porter-Cable PCC660B 20V MAX 6-1/2 in."]
  ],

  # ── Audio & Music Devices ────────────────────────────────────────────────────
  [
    "Audio & Music Devices",
    "Sony WH-1000XM5",
    <<~MD,
      ## Pairing
      1. Slide the power switch to the right and hold for 7 seconds until the indicator flashes blue/red.
      2. On your device, go to Bluetooth settings and select **WH-1000XM5**.
      3. Once paired, the headphones remember up to 10 devices; switch by pressing and holding the power button.

      ## Noise Cancellation
      - **ANC On:** Long-press the custom button on the left ear cup, or use the **Sony Headphones Connect** app.
      - **Speak-to-Chat:** Start speaking — music pauses automatically; stop speaking and it resumes after ~30 seconds.

      ## Playback Controls (right ear cup touch pad)
      - **Play/Pause:** Single tap.
      - **Skip forward:** Double tap.
      - **Skip back:** Triple tap.
      - **Volume:** Swipe up/down.

      ## Charging
      - USB-C; 3-hour full charge; 30-minute quick charge gives 3 hours of playback.
    MD
    ["Sony WH-1000XM4", "Bose QuietComfort 45", "Apple AirPods Max 2nd Gen", "Sennheiser Momentum 4 Wireless", "Jabra Evolve2 85", "Anker Soundcore Q45", "Microsoft Surface Headphones 2+", "Bose QuietComfort Ultra Headphones", "B&W Px8", "Beyerdynamic Amiron 200", "Plantronics Voyager Focus 2 UC", "JBL Tour One M2", "Shure AONIC 50 Gen 2", "Austrian Audio Hi-X65", "Denon AH-GC30", "Audio-Technica ATH-M50xBT2", "Poly Voyager Surround 85 UC"]
  ],
  [
    "Audio & Music Devices",
    "Sonos Era 300",
    <<~MD,
      ## Setup
      1. Plug in and open the **Sonos** app on your phone.
      2. Tap **Set Up New System** or **Add Product** if you already have Sonos speakers.
      3. Follow the app prompts to connect to Wi-Fi.

      ## Playing Music
      - **Sonos app:** Browse services (Spotify, Apple Music, Amazon Music) and tap **Play**.
      - **AirPlay 2:** Select Era 300 from the AirPlay menu on any Apple device.
      - **Bluetooth:** Tap the Bluetooth icon on top of the speaker to switch to Bluetooth mode.

      ## Spatial Audio
      - Pair two Era 300s as a stereo pair or as rear surrounds with an Arc soundbar in the app.
      - Trueplay tuning: tap your speaker in the app › **Settings › Trueplay** and walk around the room while it plays test tones.
    MD
    ["Sonos Era 100", "Apple HomePod 2nd Gen", "Amazon Echo Studio", "Bose SoundLink Max", "Bang & Olufsen Beosound A5", "Bose Smart Soundbar 900", "Samsung HW-Q990C", "LG DS95QR", "Sony HT-A7000", "Denon Home Sound Bar 550", "Polk Audio Magnifi Max SR AX", "Vizio Elevate P514A-H6", "Yamaha YAS-209BL", "Klipsch Bar 54", "JBL Bar 1300X", "Sennheiser AMBEO Soundbar Plus", "TCL Alto R1 TS7010"]
  ],

  # ── Cameras & Photography Gear ───────────────────────────────────────────────
  [
    "Cameras & Photography Gear",
    "Sony Alpha A7 IV",
    <<~MD,
      ## Getting Started
      1. Insert a UHS-II SD card into Slot 1.
      2. Attach a lens — align the orange dots and rotate until it clicks.
      3. Power on and complete the date/time/language setup.

      ## Shooting Modes (mode dial)
      - **P:** Program auto — camera sets aperture and shutter, you set ISO.
      - **A:** Aperture priority — set f-stop; camera sets shutter speed.
      - **S:** Shutter priority — set shutter speed; camera sets aperture.
      - **M:** Full manual.

      ## Autofocus
      - Default is **Wide AF** — the camera detects and tracks subjects automatically.
      - For eye/animal/bird detection: **Menu › AF › Subject Recognition AF** — toggle on.

      ## Video
      - Rotate the still/video switch beside the shutter button.
      - Supports 4K 60p (cropped) or 4K 30p (full-frame) with S-Cinetone profile.
    MD
    ["Sony Alpha A7C II", "Nikon Z6 III", "Canon EOS R6 Mark II", "Fujifilm X-T5", "Panasonic Lumix S5 II", "Sony Alpha A7R V", "Nikon Z8", "Canon EOS R5 Mark II", "Fujifilm GFX100S II", "Sigma fp L", "Leica SL3", "Hasselblad X2D 100C", "OM System OM-1 Mark II", "Pentax K-3 Mark III Monochrome", "Ricoh GR IIIx", "Phase One XF IQ4 150MP", "Nikon Zf"]
  ],
  [
    "Cameras & Photography Gear",
    "DJI Mini 4 Pro",
    <<~MD,
      ## Pre-Flight Checklist
      1. Charge the drone battery and remote controller fully.
      2. Open the **DJI Fly** app; ensure firmware is up to date.
      3. Go outdoors; unfold the drone arms; attach the battery; power on drone then remote.
      4. Accept the airspace check in the app — confirm flying legally.

      ## Taking Off
      1. Tap **Go Fly** in the DJI Fly app.
      2. Slide the takeoff slider on screen — the drone lifts to 1.2 m and hovers.
      3. Use the left stick (altitude/yaw) and right stick (pitch/roll) to navigate.

      ## QuickShots
      - Tap the QuickShot icon, select a pattern (Dronie, Circle, Boomerang), and the drone executes it automatically.

      ## Landing
      - Tap the **Land** button on screen, or push the left stick fully down and hold.

      > **Regulations:** Always check local drone laws; register your drone if required.
    MD
    ["DJI Mini 3 Pro", "DJI Air 3", "Autel Robotics EVO Nano+", "Holy Stone HS720E", "Potensic ATOM SE", "Parrot Anafi USA", "Skydio 2+", "Yuneec Mantis Q", "PowerVision PowerEgg X Wizard", "Hubsan Zino Pro Plus", "FIMI X8 Mini V2", "Ruko F11GIM2", "Contixo F24 Pro", "Snaptain SP500", "Ryze Tello EDU", "DJI Avata 2", "Autel Robotics EVO II Pro V3"]
  ],

  # ── Gaming Accessories ───────────────────────────────────────────────────────
  [
    "Gaming Accessories",
    "PlayStation 5 DualSense Wireless Controller",
    <<~MD,
      ## Pairing
      1. Connect to PS5 via USB-C to pair initially.
      2. Once paired, hold the **PS button** to power on wirelessly.
      3. For PC: hold **PS + Create** for 3 seconds to enter Bluetooth pairing mode; pair in Windows Bluetooth settings.

      ## Features
      - **Haptic Feedback:** Feel in-game textures and impacts through the grips — adjust intensity in **PS5 Settings › Accessories**.
      - **Adaptive Triggers:** L2/R2 resist dynamically (e.g., bowstring tension, brake feel).
      - **Create Button:** Press to capture screenshots; hold to record video; press twice for broadcast options.

      ## Charging
      - USB-C charging; also charges in the DualSense Charging Station.
      - Battery level shown on PS5 home screen; approximately 12 hours playtime.
    MD
    ["Xbox Wireless Controller Series X/S", "Nintendo Switch Pro Controller", "Razer Wolverine V3 Pro", "Thrustmaster eSwap X2 Pro", "8BitDo Ultimate 2 Wireless", "PowerA Spectra Infinity Enhanced Wired", "Hori Fighting Commander OCTA", "NACON Revolution 5 Pro", "Scuf Reflex Pro", "Victrix Pro BFG", "Turtle Beach Recon Cloud", "Backbone One PlayStation Edition", "Kishi V2 Pro", "Razer Kishi Ultra", "GameSir G8 Galileo", "Flydigi Apex 4", "EasySMX X15"]
  ],
  [
    "Gaming Accessories",
    "Razer BlackShark V2 Pro 2023",
    <<~MD,
      ## Wireless Setup
      1. Plug the USB dongle into your PC or console.
      2. Power on the headset with the power button on the right ear cup — it auto-connects to the dongle.

      ## Bluetooth Mode
      - Hold the Bluetooth button on the left ear cup for 3 seconds to enter pairing mode.
      - Pair with a phone for simultaneous audio (game + Discord + phone call).

      ## THX Spatial Audio
      - Download **Razer Synapse** and enable **THX Spatial Audio** for 360° surround simulation.
      - Toggle between stereo and spatial with the button above the power switch.

      ## Microphone
      - Flip the boom mic down to activate; flip up to mute.
      - Adjust mic gain and EQ in Razer Synapse.
    MD
    ["SteelSeries Arctis Nova Pro Wireless", "HyperX Cloud Alpha Wireless", "Corsair HS80 RGB Wireless", "Astro A50 X", "Turtle Beach Stealth 700 Gen 3", "Razer BlackShark V2 Pro 2023", "JBL Quantum 910 Wireless", "Logitech G733 LIGHTSPEED", "Sennheiser GSP 670", "Beyerdynamic MMX 300 Pro", "Creative SXFI AIR C", "Cooler Master MH752", "Asus ROG Strix Fusion 700", "Epos H6PRO Closed", "Fnatic React+", "Xiberia Nari Ultimate", "Lucidsound LS50X"]
  ],

  # ── Travel & Portable Gadgets ─────────────────────────────────────────────────
  [
    "Travel & Portable Gadgets",
    "Anker 737 Power Bank 24000mAh",
    <<~MD,
      ## Charging the Power Bank
      1. Connect via the USB-C port marked **Input/Output** using a 65 W+ charger.
      2. Full recharge takes approximately 2 hours with a 140 W charger.
      3. LED digits display current charge percentage.

      ## Charging Devices
      - **USB-C Port 1 (140 W):** Laptops, phones, tablets.
      - **USB-C Port 2 (30 W):** Phones and accessories.
      - **USB-A Port (18 W):** Older devices.
      - Press the **Power Button** once to wake the bank before connecting devices.

      ## Tips
      - The bank auto-detects low-current accessories (e.g., earbuds) via trickle-charge mode — hold the power button for 2 seconds to enable.
      - Airline regulations generally permit power banks up to 100 Wh in carry-on; check this bank's watt-hour rating against your airline's policy.
    MD
    ["Anker 733 Power Bank 10000mAh", "Baseus Blade 100W 20000mAh", "Mophie Powerstation Pro AC 22000mAh", "RavPower PD Pioneer 20000mAh", "Zendure SuperTank Pro", "Aukey PB-Y36 26800mAh", "Xiaomi 50W Power Bank 20000 PB200SZM", "INIU BI-B63 25000mAh", "Jackery Explorer 300 Plus", "Ugreen Nexode 20000mAh 100W", "Omni 20+ Omnicharge 20400mAh", "Goal Zero Sherpa 100PD", "Voltaics Arc 20 USB Battery Pack", "Nitecore NB10000 GEN3", "Cygnett ChargeUp Pro 26K 78W", "Mycharge Hubmax Universal 10050mAh", "Belkin BPZ001btBK 10000mAh"]
  ],
  [
    "Travel & Portable Gadgets",
    "Tile Pro 2022",
    <<~MD,
      ## Setup
      1. Download the **Tile** app and create an account.
      2. Pull the plastic tab from the Tile Pro to activate the battery.
      3. Tap **+** in the app and follow the on-screen pairing wizard.
      4. Attach the Tile to keys, luggage, or any item you might lose.

      ## Finding Items
      - **In Range (400 ft):** Tap **Find** in the app — the Tile plays a loud ringtone.
      - **Out of Range:** The Tile network anonymously detects your Tile via other Tile users' phones and updates its location on the map.

      ## Ring Your Phone
      - Press the Tile button twice — your phone rings even if it's on silent.

      ## Battery
      - Non-replaceable CR2032-equivalent; battery lasts approximately 1 year.
      - The app notifies you when the battery is low.
    MD
    ["Tile Mate 2022", "Apple AirTag", "Samsung SmartTag2", "Chipolo ONE Spot", "Pebblebee Clip", "Cube Shadow GPS Tracker", "Tile Pro 2022", "Orbit Tracking Card", "Nutale Findthing F9S", "Rinex Smart Finder", "LandAirSea 54 GPS Tracker", "Bouncie GPS Car Tracker", "Spytec GL300 GPS Tracker", "Tile Sticker 2022", "Chipolo CARD Spot", "Eufy Security SmartTrack Link T87B0", "Moment Smart Tag WSD-B600"]
  ],

  # ── Industrial & Workplace Tools ─────────────────────────────────────────────
  [
    "Industrial & Workplace Tools",
    "Fluke 117 True-RMS Digital Multimeter",
    <<~MD,
      ## Safety First
      - Check that test leads, probe tips, and the meter are rated for the voltage you are measuring.
      - Never measure current on a circuit above the rated input (10 A max for 30 seconds; 600 V CAT III).
      - Inspect leads for damaged insulation before each use.

      ## Measuring AC Voltage
      1. Insert the black lead into **COM**, red into **VΩ**.
      2. Turn the dial to **V~** (AC Voltage).
      3. Touch probes to the circuit; read the stable value on screen.

      ## Measuring DC Voltage
      1. Same connections as above.
      2. Turn dial to **V⎓** (DC Voltage).
      3. Touch red to positive, black to negative.

      ## Measuring Resistance
      1. **De-energise the circuit first.**
      2. Dial to **Ω**; touch probes across the component.

      ## Continuity
      - Dial to the **beep** symbol — the meter beeps if resistance is below ~30 Ω, indicating continuity.
    MD
    ["Fluke 177 True-RMS", "Klein Tools MM700", "Extech EX330", "Uni-T UT61E+", "Brymen BM869s", "Fluke 87V Industrial Multimeter", "Keysight U1252B", "Hioki DT4261", "Metrosonics db-308", "Gossen Metrawatt METRALINE TRMS 10A", "Amprobe AM-510", "Gardner Bender GDT-3190", "Ideal 61-340 Digital Clamp Meter", "Southwire 14060S", "Fieldpiece HS36 Expandable Stick Multimeter", "Triplett 9045-A Digital Multimeter", "Mastech MS8268"]
  ],
  [
    "Industrial & Workplace Tools",
    "Milwaukee 2367-20 M12 USB Power Source",
    <<~MD,
      ## Overview
      The Milwaukee M12 USB Power Source converts M12 battery power into USB-A output for charging phones, tablets, and accessories on the job site.

      ## Use
      1. Slide an M12 battery (not included) into the base until it clicks.
      2. Connect your USB device to the USB-A port.
      3. Charging begins automatically; the LED indicates output is active.

      ## Tips
      - Compatible with all M12 batteries (1.5 Ah–6.0 Ah); higher capacity = more charge cycles.
      - The unit auto-shuts off if no load is detected for 30 seconds to preserve battery.
      - Use in conjunction with the Milwaukee One-Key app to track tool and battery location.
    MD
    ["Milwaukee 48-59-1201 M12 Charger", "DeWalt DCB094 20V USB Charging Kit", "Bosch GAA18V-24N USB Charger", "Ryobi PCL682B 18V USB Charger", "Makita ADP05 18V LXT USB Adapter", "Greenworks 40V USB Charging Adapter GBA80400", "EGO Power+ CHX5500 USB Power Adapter", "Metabo 2x USB Power Adapter 657040000", "Hilti C 4/36-350 Charger", "Festool TCL 6 DUO Charger 576832", "Snap-on IC761A 14.4V-18V USB Adapter", "Flex 10.8/18V USB Adapter FX-BUSBA1021", "AEG BLK18 18V USB Charger", "Panasonic EY0L82B USB Adapter", "Ridgid AC87USBKIT Universal USB Adapter", "Craftsman CMCUSB1 20V USB Adapter", "Hart HPUCBA 40V USB Adapter"]
  ]
]

categories_by_name = Category.all.index_by(&:category_name)

devices_data.each do |category_name, device_name, instructions, related|
  cat = categories_by_name[category_name]
  next unless cat

  Device.find_or_create_by!(name: device_name, category_id: cat.id) do |d|
    d.text_instructions = instructions
    d.related_devices   = related
  end
end
