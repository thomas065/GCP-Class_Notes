#Thanks to Thomas
#!/bin/bash
# Update and install Apache2
apt update
apt install -y apache2

# Start and enable Apache2
systemctl start apache2
systemctl enable apache2

# GCP Metadata server base URL and header
METADATA_URL="http://metadata.google.internal/computeMetadata/v1"
METADATA_FLAVOR_HEADER="Metadata-Flavor: Google"

# Use curl to fetch instance metadata
local_ipv4=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/network-interfaces/0/ip")
zone=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/zone")
project_id=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/project/project-id")
network_tags=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/tags")

# Create a simple HTML page and include instance details
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
    body {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: black;
  background-image: radial-gradient(
    circle,
    rgba(255, 255, 255, 0.2) 1px,
    transparent 1px
  );
  background-size: 1rem 1rem;
}

.container {
display: flex;
    justify-content: space-between; 
    align-items: center;
    flex-wrap: nowrap;
    gap: 2em;
    padding: 1rem;
    width: 100vw; 
    height: 100vh; 
    text-align: center;
}

.column {
  flex: 1;
  padding: 1rem;
  justify-content: space-between;
  margin: auto;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.error-code {
  font-family: "Schibsted Grotesk", sans-serif;
  font-size: clamp(2rem, 16vw, 14rem);
  font-optical-sizing: auto;
  font-optical-sizing: auto;
  font-weight: 800;
  font-style: normal;
  text-align: center;
  color: #fff;
  line-height: 1;
}

.error-message {
  font-family: "Schibsted Grotesk", sans-serif;
  font-optical-sizing: auto;
  padding: 1rem;
  line-height: 1.6;
  font-weight: 400;
  font-size: clamp(1rem, 1vw, 10rem);
  font-style: normal;
  text-align: center;
  color: #fff;
  margin-top: 0.1rem;
  
}

.brain-emoji {
    font-size: clamp(6rem, 1vw, 10rem);
    display: inline-block;
    text-align: center;
    opacity: 0;
    animation: bounceIn 1s ease-out forwards, brainPulse 2s ease-in-out infinite;
    transition: opacity 0.8s ease-in-out;
}

.glow-red {
    filter: drop-shadow(0 0 10px #ff3333) drop-shadow(0 0 30px #ff7777);
}

.glow-green {
    filter: drop-shadow(0 0 10px #90e140) drop-shadow(0 0 30px #90e140);
}

.error-code, 
.error-message {
    opacity: 0; 
    animation: bounceIn 1s ease-out forwards;
}

.column.left,
.column.right {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: auto;
}

.speech-bubble {
  position: relative;
  margin: auto;
  justify-content: center;
  align-items: center;
  color: rgba(0, 0, 0, 0.8);
  margin: auto;
  padding: 1.5em;
  max-width: 15vw;
  font-size: clamp(0.6rem, 1vw, 1rem);
  border-radius: 3em;
  text-align: center;
  font-family: "Schibsted Grotesk", sans-serif;
  font-optical-sizing: auto;
  font-weight: 400;
  font-style: normal;
  font-size: clamp(1rem, 0.8vw, 5rem);
  font-optical-sizing: auto;
  font-weight: 400;
  font-style: normal;
  animation: brainPulse 2s ease-in-out infinite; 
}

.speech-bubble::after {
  content: "";
  position: absolute;
  bottom: -1em;
  width: 1.5em;
  height: 2em;
  background: inherit; 
    clip-path: polygon(50% 100%, 0 0, 100% 0); /* Triangle shape */
    transform: scale(2);
}

.left .speech-bubble {
  background: #ff4d4d;
  color: black;
}

.left .speech-bubble::after {
  background: #ff4d4d;
  right: 2.5em;
  transform: rotate(-45deg); 
}

.right .speech-bubble {
  background: #90e140;
  color: black;
}

.right .speech-bubble::after {
  background: #90e140;
  left: 2.5em;
  transform: rotate(45deg); 

}

@keyframes brainPulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.1); }
}

@keyframes float {
  0% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-10px);
  }
  100% {
    transform: translateY(0);
  }
}

@keyframes bounceIn {
  0% {
    transform: scale(0.7);
    opacity: 0;
  }
  50% {
    transform: scale(1.1);
    opacity: 1;
  }
  70% {
    transform: scale(0.9);
    opacity: 1;
  }
  100% {
    transform: scale(1);
    opacity: 1;
  }
}

@keyframes popFade {
  0% { 
        opacity: 0; 
        transform: scale(0.8) translateY(10px); 
    }
    10% { 
        opacity: 1; 
        transform: scale(1) translateY(0); 
    }
    60% { 
        opacity: 1; 
        transform: scale(1.1); 
    }
    100% { 
        opacity: 1; 
        transform: scale(1); 
    }
}

@keyframes brainGlowRed {
    0% { filter: drop-shadow(0 0 0px rgba(255, 77, 77, 0)); } 
    50% { filter: drop-shadow(0 0 30px rgba(255, 77, 77, 1)); } 
    100% { filter: drop-shadow(0 0 0px rgba(255, 77, 77, 0)); } 
}

@keyframes brainGlowGreen {
    0% { filter: drop-shadow(0 0 0px rgba(144, 225, 64, 0)); } 
    50% { filter: drop-shadow(0 0 30px rgba(144, 225, 64, 1)); } 
    100% { filter: drop-shadow(0 0 0px rgba(144, 225, 64, 0)); } 
}


.error-code { animation-delay: 0s; } 
.error-message { animation-delay: 1s; }
.brain-emoji { animation-delay: 2s; } 

.speech-bubble {
  opacity: 0; 
  animation: brainPulse 5s;
}



@media (max-width: 768px) {
  .left .speech-bubble::after {
    left: 25% !important;
    transform: translateX(-25%) !important;
  }

  .right .speech-bubble::after {
    right: 25% !important;
    transform: translateX(-25%) !important;
  }
}

@media (max-width: 480px) {
  .left .speech-bubble::after {
    left: 50% !important;
    transform: translateX(-50%) !important;
  }

  .right .speech-bubble::after {
    right: 25% !important;
    transform: translateX(-25%) !important;
  }

  .speech-bubble {
    max-width: 80vw;
  }
}
</style>

</head>
<body><div class="container">
  <div class="column left">
    <div class="speech-bubble bubble-red bubble-1">I’ve broken the internet. Nice going.</div>
    <div class="speech-bubble bubble-red bubble-3">What if this was important? What if it’s lost forever?</div>
    <div class="speech-bubble bubble-red bubble-5">Keisha always mess things up.</div>
    <div class="speech-bubble bubble-red bubble-7">Maybe this was a sign… a bad one.</div>
    <div class="speech-bubble bubble-red bubble-9">Will THEO Help me get rid of Keisha?</div>
  </div>
  <div class="column middle">
    <div class="error-code">Keisha was Here...</div>
    <div class="error-message">
      <p>
      <div>Compute Instance Information:</div>
<div>Instance Name:&nbsp;$(hostname -f)</div>
<div>Zone:&nbsp;$zone</div>
<div>Project ID:&nbsp;$project_id</div>
<div>Network Tags:&nbsp;$network_tags</div>
</p>
    </div>
    <div class="brain-emoji">🧠</div>
  </div>
  <div class="column right">
    <div class="speech-bubble bubble-green bubble-2">Relax, you're broke and Keisha don't want you.</div>
    <div class="speech-bubble bubble-green bubble-4">Maybe the Keisha just went for a walk?</div>
    <div class="speech-bubble bubble-green bubble-6">Not every Keisha is a mistake. Some lead to hidden paths.</div>
    <div class="speech-bubble bubble-green bubble-8">Keisha? More like 3-ho-4! Right? ...Right?</div>
    <div class="speech-bubble bubble-green bubble-10">You can still hit it from the back.</div>
  </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
  const brain = document.querySelector(".brain-emoji");

  const bubbleSequence = [
    document.querySelector(".bubble-1"),
    document.querySelector(".bubble-2"),
    document.querySelector(".bubble-3"),
    document.querySelector(".bubble-4"),
    document.querySelector(".bubble-5"),
    document.querySelector(".bubble-6"),
    document.querySelector(".bubble-7"),
    document.querySelector(".bubble-8"),
    document.querySelector(".bubble-9"),
    document.querySelector(".bubble-10")
  ].filter((bubble) => bubble !== null);

  let index = 0;

  function showBubble() {
    if (index >= bubbleSequence.length) {
      setTimeout(() => {
        index = 0;
        showBubble();
      }, 3000);
      return;
    }

    let bubble = bubbleSequence[index];

    if (!bubble) return;

    let isRed = bubble.classList.contains("bubble-red");
    let isGreen = bubble.classList.contains("bubble-green");

    // Show the bubble
    bubble.style.opacity = "1";
    bubble.style.transform = "scale(1)";
    // Show the bubble
    bubble.style.opacity = "1";
    bubble.style.transform = "scale(1)";

    // Restart animation to make the bubble pulse
    bubble.style.animation = "none"; // Reset animation
    bubble.offsetHeight; // Force reflow to restart animation
    bubble.style.animation = "brainPulse 3s ease-in-out infinite"; // Apply pulse

    if (isRed) {
      brain.classList.add("glow-red");
    } else if (isGreen) {
      brain.classList.add("glow-green");
    }

    setTimeout(() => {
      bubble.style.opacity = "0";
      bubble.style.transform = "scale(0.8)";
      brain.classList.remove("glow-red", "glow-green");

      setTimeout(() => {
        index++;
        showBubble();
      }, 1000);
    }, 4000);
  }

  setTimeout(() => {
    showBubble();
  }, 6000);
});
</script>
</body>
</html>
EOF