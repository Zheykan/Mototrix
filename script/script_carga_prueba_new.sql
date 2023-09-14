insert into cliente values(1000,"Dario Jimenez","xxx001","Dario@example.com");
insert into cliente values(1001,"Oscar Ospina","xxx002","Oscar@example.com");
insert into cliente values(1002,"Pedro Mendoza","xxx003","Pedro@example.com");
insert into cliente values(1003,"Luis Garcia","xxx004","Luis@example.com");
insert into cliente values(1004,"Carla Mendez","xxx005","Carla@example.com");
insert into cliente values(1005,"Erik Quemado","xxx006","Erik@example.com");
insert into cliente values(1006,"Juliana Escorcia","xxx007","Juliana@example.com");

insert into empleado values(10,"contraseniaGenerica","Mario Castaño","xxx000","Mecanico",1500000.0);
insert into empleado values(11,"contraseniaGenerica","Carlos Puebla","xxx22","Mecanico",0.0);
insert into empleado values(12,"contraseniaGenerica","Maria Cruz","xxx333","cajero",0.0);
insert into empleado values(13,"contraseniaGenerica","Stiven Montes","xxx444","Mecanico",0.0);

insert into proveedor values(5000,"Mapana","Mapana@hotmail.com","315487558");
insert into proveedor values(5001,"YAMAHA","yamaha@repuestos.com","658941");
insert into proveedor values(5002,"HONDA","honda@repuestos.com","458811");
insert into proveedor values(5003,"PULSAR","pulsar@repuestos.com","485697");
insert into proveedor values(5004,"SUZUKI","suzuki@repuestos.com","255698");
insert into proveedor values(5005,"BENELLI","benelli@repuestos.com","145875");
insert into proveedor values(5006,"BMW","bmw@repuestos.com","364812");
insert into proveedor values(5007,"AUTECO","auteco@repuestos.com","322594");
insert into proveedor values(5008,"AKT","akt@repuestos.com","145787");

insert into vehiculos values(2220,"673-ASF","SUZUKI","Nx100",2006,"Bueno",89200,1000);
insert into vehiculos values(2221,"123-XSF","HONDA","Kairos",2018,"Bueno",41500,1001);
insert into vehiculos values(2222,"976-TGB","AKT","NKD 125",2021,"Bueno",5500,1002);
insert into vehiculos values(2223,"303-OCM","AUTECO","TVS RAIDER 125",2020,"Bueno",85500,1003);
insert into vehiculos values(2224,"276-IPF","BENELLO","180S",2017,"Bueno",19004,1004);
insert into vehiculos values(2225,"209-HGM","BMW","R 18",2010,"Bueno",62400,1005);
insert into vehiculos values(2226,"311-WSR","PULSAR","NS 125",2020,"Bueno",26500,1000);
insert into vehiculos values(2227,"152-DDZ","YAMAHA","MOTO3",2019,"Bueno",45900,1003);
insert into vehiculos values(2228,"435-CGO","HONDA","PCX 150",2021,"Bueno",24500,106);
insert into vehiculos values(2229,"300-LPR","AUTECO","MAX 125",2020,"Bueno",92500,1003);

insert into servicios values(71,"Cambio de liquido refrigerante",50000.0,true,false,1,9007);
insert into servicios values(72,"Limpieza de kit de arrastre",30000.0,true,false,1,9005);
insert into servicios values(73,"Lubricacion de elementos del kit de arrastre",25000.0,true,false,1,9003);
insert into servicios values(74,"Limpieza interna del motor",45000.0,true,false,1,9004);
insert into servicios values(75,"Cambio de aceite de motor",80000.0,true,true,10016,9001);
insert into servicios values(76,"Cambio Kit de arrastre",200000.0,false,true,10006,1);
insert into servicios values(77,"Revision de inyectores de gasolina",60000.0,false,false,1,1);
insert into servicios values(78,"Cambio de kit de encendido",40000.0,false,true,10012,1);

insert into refacciones values(10001,"herradura","12",50000.0,62000.0,5000);
insert into refacciones values(10002,"Guaya Clutch ","1",45000.0,47250.0,5008);
insert into refacciones values(10003,"Soporte Manigueta Clutch Completo ","1",76000.0,79800.0,5004);
insert into refacciones values(10004,"Monoshock Amortiguador ","1",245000.0,257250.0,5002);
insert into refacciones values(10005,"Juego Bujias Iridium ","3",28300.0,29715.0,5006);
insert into refacciones values(10006,"Kit Arrastre Speed Racing ","1",128000.0,134400.0,5001);
insert into refacciones values(10007,"Llanta Moto 100/80/17 Corsa Sportrain","1",204500.0,214725.0,5005);
insert into refacciones values(10008,"Bocina","1",40000.0,42000.0,5008);
insert into refacciones values(10009,"Espejos","2",20000.0,21000.0,5003);
insert into refacciones values(10010,"Base Calapie Reposapie ","1",130000.0,136500.0,5007);
insert into refacciones values(10011,"Clutch Semi Completo ","1",137400.0,144270.0,5004);
insert into refacciones values(10012,"Kit Switch Encendido ","1",128000.0,134400.0,5006);
insert into refacciones values(10018,"Pastillas Traseras ","1",32000.0,35000.0,5004);
insert into refacciones values(10013,"Direccionales el par","2",83200.0,84860.0,5001);
insert into refacciones values(10014,"Cadena Reforzada De Oring ","2",140390.0,145000.0,5005);
insert into refacciones values(10015,"Disco De Freno Trasero ","1",115300.0,118000.0,5000);
insert into refacciones values(10016,"Filtro De Aceite","1",15000.0,18000.0,5008);
insert into refacciones values(10017,"Filtro De Aire","1",43000.0,46000.0,5007);

insert into insumos values(9001,"Aceite 10w-40 Street 2lt Sintetico Liqui Moly",15,84500.0,92900.0);
insert into insumos values(9002,"Grasa Lubricante Moto 450g",8,15000.0,18000.0);
insert into insumos values(9003,"Lubricante Cadena Spray Moto Liqui Moly 250ml",5,46900.0,52500.0);
insert into insumos values(9004,"Limpiador Interno De Motor Liqui Moly 300ml",5,37100.0,40500.0);
insert into insumos values(9005,"Limpiador De Frenos Cadenas Liqui Moly 500ml",10,25200.0,28000.0);
insert into insumos values(9006,"Silicona Sellador Alta Temperatura 85g Negro",10,12860.0,15000.0);
insert into insumos values(9007,"Liquido Refrigerante Moto Ipone Liquid 1l",7,41900.0,46000.0);
insert into insumos values(9008,"Líquido Para Frenos Dot 3",10,12600.0,14000.0);
insert into insumos values(9009,"Silicona Protectora Simoniz Filtro 300ml",4,14900.0,16000.0);
insert into insumos values(9000,"Gasolina 1L",50,2478.0,2600.0);

insert into ficha_de_servicio values(20000,1002,10,2222,'2007/08/23 14:40:10',"En Diagnostico",60000.0);
insert into ficha_de_servicio values(20001,1003,11,2227,'2007/10/05 09:15:10',"En Reparacion",200000.0);

insert into vinculo_servicio values(20000,77);
insert into vinculo_servicio values(20001,76);

