# inputbarang app
This application is built using flutter, serverpod as the backend and postgres as the database. This application is useful for entering data on goods, suppliers, transactions, and purchase lists.

<table>
  <th><h3>🛠️ Features</h3></th>
  <tr>
    <!-- features -->
    <td>
      <ul>
        <li>Input data barang, supplier, transaksi.</li>
        <li>Edit data.</li>
        <li>Delete data.</li>
        <li>Update data.</li>
        <li>Show data.</li>
      </ul>
    </td>
  </tr>
</table>

## 📋 Previews
This is an overview of the erd database:
<p align="center">
  <img src="https://raw.githubusercontent.com/kisahtegar/inputbarang/master/previews/erd.png" width="591" height="241"/>
</p>

This the output application after running the project.
<p align="center">
  <img src="https://raw.githubusercontent.com/kisahtegar/inputbarang/master/previews/1.png"  width="800" height="400"/>
  <img src="https://raw.githubusercontent.com/kisahtegar/inputbarang/master/previews/2.png"  width="800" height="400"/>
  <img src="https://raw.githubusercontent.com/kisahtegar/inputbarang/master/previews/3.png"  width="800" height="400"/>
  <img src="https://raw.githubusercontent.com/kisahtegar/inputbarang/master/previews/4.png"  width="800" height="400"/>
</p>

## 🧪 Getting Started
Start your Docker containers with `docker-compose up --build --detach`. It will start Postgres and Redis. Then, run `dart bin/main.dart` to start your server.

    cd inputbarang/inputbarang_server
    docker-compose up --build --detach
    dart bin/main.dart

If everything is working, you should see something like this on your terminal:

    SERVERPOD version: 1.x.x, mode: development, time: 2022-09-12 17:22:02.825468Z
    Insights listening on port 8081
    Server default listening on port 8080
    Webserver listening on port 8082

After that, we need to run our flutter application, recommend using windows:

    cd inputbarang/inputbarang_flutter
    flutter run -d windows

## ✨ About Us
- 💻 All of my projects/repository are available at [github.com/kisahtegar](https://github.com/kisahtegar)
- 📫 How to reach me **code.kisahtegar@gmail.com**
- 📄 Know about my experiences [kisahcode.web.app](https://kisahcode.web.app)