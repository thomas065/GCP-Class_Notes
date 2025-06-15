# Thanks to Thomas
#!/bin/bash

# Log start of script
echo "Startup script starting..." >> /var/log/startup-script.log

# Update and install Apache2
apt update -y
apt install -y apache2

# Start and enable Apache2
systemctl start apache2
systemctl enable apache2

# Give Apache time to fully start
sleep 5

# GCP Metadata server base URL and header
METADATA_URL="http://metadata.google.internal/computeMetadata/v1"
METADATA_FLAVOR_HEADER="Metadata-Flavor: Google"

# Fetch instance metadata
local_ipv4=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/network-interfaces/0/ip")
zone=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/zone")
project_id=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/project/project-id")
network_tags=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/tags")
instance_name=$(hostname -f)

# Log metadata
echo "Metadata collected:" >> /var/log/startup-script.log
echo "IP: $local_ipv4" >> /var/log/startup-script.log
echo "Zone: $zone" >> /var/log/startup-script.log
echo "Project ID: $project_id" >> /var/log/startup-script.log
echo "Network Tags: $network_tags" >> /var/log/startup-script.log
echo "Instance Name: $instance_name" >> /var/log/startup-script.log

# Remove default index if exists
rm -f /var/www/html/index.html

# Create custom index.html
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Thomas Bell - Class 6.5</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap">
<style>
	.card,.content,
	body {
		overflow: hidden;
	}
	body {
		width: 100vw;
		height: 100vh;
		padding: 0;
		margin: 0;
		display: flex;
		align-items: center;
		justify-content: center;
		background: black;
	}
	.card,
	.container {
		display: flex;
		align-items: center;
	}
	.card {
		width: 1280px;
		height: 720px;
		margin: 0;
		justify-content: center;
	}
	.container-full,
	.content {
		width: 1000px;
		height: 562px;
	}
	.backgroundImage {
		position: absolute;
		width: 1000px;
	}
	.boyImage {
		position: absolute;
		width: 1000px;
		z-index: 2;
		animation: 200s linear infinite blur;
	}
	.content {
		border-radius: 40px;
		animation: 200s linear infinite brightness;
	}
	.container {
		justify-content: center;
	}
	.container-full,
	.face {
		display: flex;
		align-items: center;
		overflow: hidden;
	}
	.container-full {
		margin: 0;
		justify-content: center;
		transform: scale(1);
		animation: 200s linear infinite zoom-in;
	}
	.cube,
	.face {
		width: 870px;
		height: 190px;
	}
	.cube {
		position: relative;
		transform-style: preserve-3d;
		perspective: 480px;
		transform-style: preserve-3d;
		perspective-origin: 51% 70%;
	}
	.face,
	.hue {
		position: absolute;
	}
	.face {
		background: 0 0;
		border: 0 solid #000;
		opacity: 0.5;
	}
	.bottom,
	.top {
		width: 870px;
		height: 870px;
	}
	p {
		white-space: nowrap;
		overflow: hidden;
		font-family: "Bebas Neue", sans-serif;
		font-weight: 400;
		font-size: calc(6em + (190px / 10) * 0.7);
		padding-top: 20px;
		color: #fff;
	}
	span {
		color: red;
	}
	.front {
		transform: translateZ(435px);
		display: none;
	}
	.back {
		transform: translateZ(-435px) rotateY(180deg) scaleX(-1);
	}
	.left {
		transform: translateX(-435px) rotateY(-90deg) scaleX(-1);
	}
	.right {
		transform: translateX(435px) rotateY(90deg) scaleX(-1);
	}
	.top {
		transform: translateY(-435px) rotateX(90deg) scaleY(-1);
	}
	.bottom {
		transform: translateY(-245px) rotateX(-90deg) scaleY(-1);
	}
	.left p {
		margin-left: 480px;
		animation: 200s linear infinite left;
	}
	.back p {
		margin-left: -390px;
		animation: 200s linear infinite back;
	}
	.right p {
		margin-left: -1260px;
		animation: 200s linear infinite right;
	}
	@keyframes left {
		100% {
			margin-left: -54000px;
		}
	}
	@keyframes back {
		100% {
			margin-left: -54870px;
		}
	}
	@keyframes right {
		100% {
			margin-left: -55740px;
		}
	}
	.hue {
		top: 0;
		left: 0;
		z-index: 3;
		width: 100%;
		height: 100%;
		mix-blend-mode: overlay;
		background: #1e5799;
		background: radial-gradient(ellipse at center, #1e5799 0, #7db9e8 100%);
		opacity: 1;
	}
	.hue.animated {
		-webkit-animation: 8s infinite filter-animation;
		animation: 8s infinite filter-animation;
	}
	.container-reflect {
		position: absolute;
		display: flex;
		align-items: center;
		justify-content: center;
		margin-top: 380px;
		filter: blur(10px);
	}
	.container-reflect .cube {
		perspective-origin: 51% -30%;
	}
	.container-reflect .back {
		transform: translateZ(-435px) rotateY(180deg) scaleX(-1) scaleY(-1);
	}
	.container-reflect .left {
		transform: translateX(-435px) rotateY(-90deg) scaleX(-1) scaleY(-1);
	}
	.container-reflect .right {
		transform: translateX(435px) rotateY(90deg) scaleX(-1) scaleY(-1);
	}

	.container-reflect p {
		transform: scaleY(70%);
	}

	@keyframes filter-animation {
		0%,
		100% {
			filter: hue-rotate(0deg);
		}
		50% {
			filter: hue-rotate(100deg);
		}
	}
	@keyframes zoom-in {
		0% {
			transform: scale(1);
		}
		100% {
			transform: scale(2.5);
		}
	}
	@keyframes blur {
		0% {
			filter: blur(0px);
		}
		100% {
			filter: blur(3px);
		}
	}
	@keyframes brightness {
		0% {
			filter: brightness(1) contrast(1);
		}
		100% {
			filter: brightness(0.8) contrast(1.3);
		}
	}
</style>
</head>
<body>
    <div class="container">
        <div class="content" style="display:block;width:1000px;height:562px">
            <div class="container-full">
                <div class="animated hue"></div>
                <img class="backgroundImage" src="https://drive.google.com/thumbnail?id=1_ZMV_LcmUXLsRokuz6WXGyN9zVCGfAHp&sz=w1920">
                <img class="boyImage" src="https://drive.google.com/thumbnail?id=1eGqJskQQgBJ67myGekmo4YfIVI3lfDTm&sz=w1920">
                <div class="container">
                    <div class="cube">
                        <div class="face top"></div>
                        <div class="face bottom"></div>
                        <div class="face left text"></div>
                        <div class="face right text"></div>
                        <div class="face front"></div>
                        <div class="face back text"></div>
                    </div>
                </div>
                <div class="container-reflect">
                    <div class="cube">
                        <div class="face top"></div>
                        <div class="face bottom"></div>
                        <div class="face left text"></div>
                        <div class="face right text"></div>
                        <div class="face front"></div>
                        <div class="face back text"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
// Instance metadata
const instanceInfo = \`
<p>
<span>Instance Name:&nbsp;</span>${instance_name}
👨🏽‍🦲<span>THEOWAF</span>👨🏽‍🦲
<span>Zone:&nbsp;</span>${zone}
<span>Project ID:&nbsp;</span>${project_id}
<span>Network Tags:&nbsp;</span>${network_tags}
🩻<span>OBEY</span>🩻
<span>Instance Name:&nbsp;</span>${instance_name}
<span>Zone:&nbsp;</span>${zone}
<span>Project ID:&nbsp;</span>${project_id}
<span>Network Tags:&nbsp;</span>${network_tags}
👧🏾<span>KEISHA</span>👧🏾
<span>Instance Name:&nbsp;</span>${instance_name}
<span>Zone:&nbsp;</span>${zone}
<span>Project ID:&nbsp;</span>${project_id}
<span>Network Tags:&nbsp;</span>${network_tags}
🩻<span>OBEY</span>🩻
<span>Instance Name:&nbsp;</span>${instance_name}
<span>Zone:&nbsp;</span>${zone}
<span>Project ID:&nbsp;</span>${project_id}
<span>Network Tags:&nbsp;</span>${network_tags}
😁<span>THE END</span>😁
</p>\`;

// Insert metadata into .text divs
document.addEventListener("DOMContentLoaded", () => {
    const divs = document.querySelectorAll(".text");
    divs.forEach(div => {
        div.innerHTML = instanceInfo;
    });

    const contentDiv = document.querySelector(".content");
    function adjustContentSize() {
        const viewportWidth = window.innerWidth;
        const baseWidth = 1000;
        const scaleFactor = viewportWidth < baseWidth ? (viewportWidth / baseWidth) * 0.8 : 1;
        contentDiv.style.transform = \`scale(\${scaleFactor})\`;
    }

    window.addEventListener("load", adjustContentSize);
    window.addEventListener("resize", adjustContentSize);
});
</script>
</body>
</html>
EOF

# Set ownership and permissions
chown www-data:www-data /var/www/html/index.html
chmod 644 /var/www/html/index.html

# Restart Apache
sleep 2
systemctl restart apache2

# Final log
echo "Startup script completed. Custom HTML deployed." >> /var/log/startup-script.log