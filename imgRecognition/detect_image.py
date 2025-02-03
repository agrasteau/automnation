import cv2
import pyautogui
import numpy as np
import sys

def detect_image(target_image_path, scale_range=(0.5, 1.5), step=0.1, threshold=0.8):
    """
    Capture l'écran et cherche si l'image cible est présente, en testant différentes échelles.
    Retourne True si trouvée, False sinon.
    """

    # Prendre un screenshot de l'écran
    screenshot = pyautogui.screenshot()
    screenshot = np.array(screenshot)
    screenshot = cv2.cvtColor(screenshot, cv2.COLOR_RGB2BGR)

    # Charger l'image cible
    target = cv2.imread(target_image_path, cv2.IMREAD_UNCHANGED)
    if target is None:
        print("Erreur : Impossible de charger l'image cible :", target_image_path)
        return False

    # Essayer différentes échelles pour s'adapter à la taille réelle à l'écran
    for scale in np.arange(scale_range[0], scale_range[1], step):
        resized = cv2.resize(target, None, fx=scale, fy=scale, interpolation=cv2.INTER_LINEAR)

        # Recherche de correspondance avec OpenCV
        result = cv2.matchTemplate(screenshot, resized, cv2.TM_CCOEFF_NORMED)
        _, max_val, _, _ = cv2.minMaxLoc(result)

        # Vérifier si l'image est bien détectée
        if max_val >= threshold:
            print(f"✅ Image détectée ({target_image_path}) avec un facteur de scale : {scale}")
            return True

    print(f"❌ Image non détectée : {target_image_path}")
    return False

if __name__ == "__main__":
    # Récupérer l'image cible en argument
    if len(sys.argv) < 2:
        print("Usage: python detect_image.py <image.png>")
        sys.exit(1)

    image_path = sys.argv[1]
    
    # Exécuter la détection
    if detect_image(image_path):
        sys.exit(0)  # Succès
    else:
        sys.exit(1)  # Échec
