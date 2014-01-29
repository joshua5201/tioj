module.exports = function(app) {
    app.get('/problems', function(req, res) {
        res.render('submissions/index', {title : "Problems"});
    });
    app.get('/problems/:id', function(req, res) {
    });
    app.post('/problems', function(req, res) {
    });
    app.put('/problems/:id', function(req, res) {
    });
    app.delete('/problems/:id', function(req, res) {
    });
}
