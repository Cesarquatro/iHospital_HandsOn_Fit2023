# iHospital-HandsOn-Fit2023
<div style="text-align: justify"> 
	
- **Nossa proposta**:<br>&nbsp;&nbsp;&nbsp;&nbsp;Sistema de entregas interno nos hospitais composto por robôs autônomos inspirados nos AGVs (*automated guided vehicles*), juntamente com aplicativos para a realização de pedidos, o acompanhamento e supervisão dos robôs. 

- **Situação Atual**:<br>&nbsp;&nbsp;&nbsp;&nbsp;No âmbito global, durante o início da pandemia de COVID-19<img src="README_img\covid19.svg" width="17" height="17" alt="covid" /> na China foram utilizados robôs de entrega hospitalares[[1]]. Já no cenário brasileiro <img src="README_img\brazil.svg" width="17" height="17" alt="brazil" />, o sistema de logística de remédios e componentes hospitalares ainda é muito burocrático e manual, o que acarreta em maior probabilidades de erros humanos.<br>&nbsp;&nbsp;&nbsp;&nbsp;Ao realizar uma pesquisa interna com profissionais de saúde, notou-se que vários hospitais possuem funcionários (mensageiros), normalmente jovens aprendizes, dedicados exlusivamente para essa tarefa.
Após, foi realizada uma pesquisa na plataforma de empregos [indeed] com palavras-chaves “jovem aprendiz hospital”, notou-se que várias vagas apresentavam atribuições de logística de entregas internas nos hospitais.

<br><img src="README_img\Vagas_indeed.png" alt="indeed"><br>**Figura 1** - Vagas para jovens-prendizes em hospitais.


 [1]: https://news.cgtn.com/news/2020-02-02/Hospitals-in-coronavirus-hit-Wuhan-use-medicine-delivery-robots-NKyRHprLry/index.html
	
 [indeed]: https://br.indeed.com/
	
- **Ideia**:<br>&nbsp;&nbsp;&nbsp;&nbsp;Por meio de um aplicativo desenvolvido em flutter, o funcionário pode solicitar remédios <img src="README_img\remedio.svg" width="17" height="17" alt="remedio" />, equipamentos <img src="README_img\ferramenta.svg" width="20" height="20" alt="ferramenta" />, documentos <img src="README_img\documentos.svg" width="19" height="19" alt="documento" /> ou outros materiais para uso. Tais solicitações são enviadas para um painel no almoxarifado ou farmácia via protocolo MQTT, por tratar-se de um protocolo simples e robusto, implementado via Wi-Fi na rede do hospital.<br>&nbsp;&nbsp;&nbsp;&nbsp;Com isso, o app envia os pedidos por meio de MQTT *publisher* para um *broker* MQTT. Ao receber o pedido, um atendente vai preparar o pacote para entrega, descrevendo o pedido e o destino em uma tag NFC no pacote.<br>&nbsp;&nbsp;&nbsp;&nbsp;Depois, o pacote é inserido em uma bandeja no AGV destinada ao transporte. Nesta bandeja, o pacote é verificado por meio do sensor RFID, e então o robô transporta ao destino com os dados obtidos pela gravação realizada na tag RFID. Posteriormente, o robô entregará no local correto destinado a comparar as informações da tag com o QRcode que contém o nome da sala de destino.

	
- **Protótipo (Handson)**:<br>&nbsp;&nbsp;&nbsp;&nbsp;O raspberry, presente no robô AGV, procura a sala do pedido através do reconhecimento de imagem escrito em python com as bibliotecas [OpenCV] e [pyzbar]. Neste caso, o robô seguirá a faixa do caminho até achar o QRcode correspondente à sala destino. Logo, ao identificar a sala através do QRcode (biblioteca [pyzbar]) correspondente ao pedido por meio da câmera, o robô para e entrega o material solicitado.<br>&nbsp;&nbsp;&nbsp;&nbsp;Para realizar uma dupla verificação, o módulo RFID é empregado, então o funcionário correlaciona o código do pedido desejado com um a tag NFC fixa no pacote. Deste modo, há menor probabilidade de erros, melhorando a confiabilidade do sistema para permitir a aplicação em um ambiente hospitalar. Com a liberação do RFID, é liberado o slot de materiais para entrega.<br>&nbsp;&nbsp;&nbsp;&nbsp;Contudo, o interfaceamento com o módulo RFID e a conexão com drivers, necessita utilizar um Arduino Uno com o módulo RFID - RC522, cujo foi conectado via SPI ao Arduino, e o módulo de Ponte H com base no L298N foi conectado às suas saídas digitais PWM.<br>&nbsp;&nbsp;&nbsp;&nbsp;Portanto, a rotina de reconhecimento de imagem do Raspberry Pi 3 envia para o arduino, via porta serial, comandos do estilo “Direita”, “Esquerda”, “Pare” ou “Frente” para que o arduino possa controlar os motores.<br>&nbsp;&nbsp;&nbsp;&nbsp;O AGV foi prototipado e impresso em uma impressora 3D utilizando PLA, este possui dois motores DC com caixas redutoras e rodas com pneus com tração traseira. Possibilitando assim a realização de manobras de curvas com a atuação dos motores de forma alternada. Economizando com sistema de volante.

<br><img src="README_img\prototipo_montado.png" width="930" height="716" alt="indeed"><br>**Figura 2** - Modelo 3D do protótipo usado demonstrado no Handson.<br><br><img src="README_img\Schematic_iHospital.png" alt="indeed"><br>**Figura 3** - Esquemático da PCI do protótipo feita no [easyEDA].

<br>&nbsp;&nbsp;&nbsp;&nbsp;Já o App possui: <br>&nbsp;&nbsp;&nbsp;&nbsp;-Tela de Login para o funcionário onde é importante destacar que por se tratar de um protótipo, não possui nenhum tipo de criptografia;<br>&nbsp;&nbsp;&nbsp;&nbsp;-Tela Home, onde terá as opções para o funcionário e apenas as opções **pedir** e **pedidos** estarão funcionando no protótipo;<br>&nbsp;&nbsp;&nbsp;&nbsp;-Tela para realizar os pedidos com 2 campos: "*Room*(quarto)" - para selecionar o quarto de entrega e "Pedido" - para escrever o predido;<br>&nbsp;&nbsp;&nbsp;&nbsp;-Tela Pedidos - para acompanhar o último pedido realizado;<br><br>&nbsp;&nbsp;&nbsp;&nbsp;Para realizar o pedido foi utilizado o protocolo MQTT juntamente com um broker, o [Mosquitto].

<br><img src="README_img\Telas.png" alt="telas"><br>**Figura 4** - Telas do aplicativo

[easyEDA]: https://oshwlab.com/luiz.acciari/ihospital
[OpenCV]: https://docs.opencv.org/2.4/modules/core/doc/intro.html
[pyzbar]: https://github.com/NaturalHistoryMuseum/pyzbar/
[Mosquitto]: https://mosquitto.org/

<br><br><img src="README_img\prot1.jpg" alt="prototipo_img1"><br>**Figura 5** - Protótipo.
<br><br><img src="README_img\prot2.jpg" alt="prototipo_img2"><br>**Figura 6** - Protótipo.
<br><br><img src="README_img\prot3.jpg" alt="prototipo_img3"><br>**Figura 7** - Protótipo.
<br><br><img src="README_img\prot4.jpg" alt="prototipo_img4"><br>**Figura 8** - Protótipo.
	
</div>
