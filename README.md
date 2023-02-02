# iHospital-HandsOn-Fit2023
<div style="text-align: justify"> 
	
- **Nossa proposta**:<br>&nbsp;&nbsp;&nbsp;&nbsp;Sistema de entregas interno nos hospitais composto por robôs autônomos inspirados nos AGVs (*automated guided vehicles*), juntamente com aplicativos para a realização de pedidos, o acompanhamento e supervisão dos robôs. 

- **Situação Atual**:<br>&nbsp;&nbsp;&nbsp;&nbsp;No âmbito global, durante o início da pandemia de COVID-19<img src="README_img\covid19.svg" width="17" height="17" alt="covid" /> na China foram utilizados robôs de entrega hospitalares[[1]]. Já no cenário brasileiro <img src="README_img\brazil.svg" width="17" height="17" alt="brazil" />, o sistema de logística de remédios e componentes hospitalares ainda é muito burocrático e manual, o que acarreta em maior probabilidades de erros humanos.<br>&nbsp;&nbsp;&nbsp;&nbsp;Ao realizar uma pesquisa interna com profissionais de saúde, notou-se que vários hospitais possuem funcionários (mensageiros), normalmente jovens aprendizes, dedicados exlusivamente para essa tarefa.
Após, foi realizada uma pesquisa na plataforma de empregos [indeed] com palavras-chaves “jovem aprendiz hospital”, notou-se que várias vagas apresentavam atribuições de logística de entrega internas nos hospitais.

<br><img src="README_img\Vagas_indeed.png" width="1389" height="500" alt="indeed"><br>**Figura 1** - Vagas para jovens-prendizes em hospitais.


 [1]: https://news.cgtn.com/news/2020-02-02/Hospitals-in-coronavirus-hit-Wuhan-use-medicine-delivery-robots-NKyRHprLry/index.html
	
 [indeed]: https://br.indeed.com/
	
- **Ideia**:<br>&nbsp;&nbsp;&nbsp;&nbsp;Por meio de um aplicativo desenvolvido em flutter, o funcionário pode solicitar remédios <img src="README_img\remedio.svg" width="17" height="17" alt="remedio" />, equipamentos <img src="README_img\ferramenta.svg" width="20" height="20" alt="ferramenta" />, documentos <img src="README_img\documentos.svg" width="19" height="19" alt="documento" /> ou outros materiais para uso. Tais solicitações são enviadas um painel no almoxarifado ou farmácia via protocolo MQTT, por tratar-se de um protocolo simples e robusto, implementado via Wi-Fi na rede do hospital.<br>&nbsp;&nbsp;&nbsp;&nbsp;Com isso, o app envia os pedidos por meio de MQTT publisher para um broker MQTT. Ao receber o pedido, um atendente vai preparar o pacote para entrega, descrevendo o pedido e o destino em uma tag NFC no pacote.

	
- **Protótipo (Handson)**:<br><img src="README_img\prototipo_montado.png" width="930" height="716" alt="indeed"><br>**Figura 2** - Modelo 3D do protótipo usado demonstrado no Handson.<br><img src="README_img\Schematic_iHospital.png" width="1169" height="826" alt="indeed"><br>**Figura 3** - Esquemático da PCI do protótipo feita no [easyEDA].
	
[easyEDA]: https://oshwlab.com/luiz.acciari/ihospital
</div>
