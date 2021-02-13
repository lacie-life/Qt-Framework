
WorkerScript.onMessage = function(message) {
   // var data = {'name': "Apple", 'cost': message.x}
  //  message.model.append(data);
    message.model.get(0).cost = message.x
    message.model.get(1).cost = message.y
    message.model.get(2).cost = (message.y + message.x)/ 2
    message.model.sync();

    WorkerScript.sendMessage(
                { 'reply': 'Mouse is at ' + message.x + ',' + message.y , 'test': 'this is test' })
}
