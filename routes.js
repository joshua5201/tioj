module.exports = function(app) {
  var index = 'index'; //setting index page
  app.get('/', function (req, res) {
    res.render(index, {title: 'Home'});
  });
  require('./controllers/submissions.js')(app);
}
