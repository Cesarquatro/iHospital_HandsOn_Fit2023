import cv2

a = ""
#abrir a camera
cap = cv2.VideoCapture(1)

# initialize the cv2 QRCode detector
detector = cv2.QRCodeDetector()

while True:
    # read the image
    _, img = cap.read()
    
    # detect and decode
    data, bbox, _ = detector.detectAndDecode(img)
    # check if there is a QRCode in the image
    if data:
        a=data
        break

    cv2.imshow("QRCODEscanner", img)    

    if cv2.waitKey(1) == ord("q"):
        break
  
    if a != "":
        print(a)
cap.release()
cv2.destroyAllWindows()