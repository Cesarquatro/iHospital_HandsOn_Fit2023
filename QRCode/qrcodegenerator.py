import qrcode #pip install qrcode[pil]
import os

caminho = "" #coloque seu caminho aqui

#função que cria e salva o QRCode
def generateQR(text):
  text = str(text)

  img = qrcode.make(f"{text}")

  img.save(f"{caminho}{text}.png", "PNG")
  os.system(f"{caminho}{text}.png")
  print(f"Saved - {text}")

#Conteudo escrito no QRCode
nome = ""

for i in range (0, 10):
  nome = "room_" + str(i)
  
  generateQR(nome)

nome = "home"
generateQR(nome)
