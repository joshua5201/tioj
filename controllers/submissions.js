module.exports = function(app) {
    app.get('/submissions', function(req, res) {
        res.render('submissions/index', {title : "Submissions"});
    });
    app.get('/submissions/:id', function(req, res) {
    });
    app.post('/submissions', function(req, res) {
    });
    app.put('/submissions/:id', function(req, res) {
    });
    app.delete('/submissions/:id', function(req, res) {
    });
}
