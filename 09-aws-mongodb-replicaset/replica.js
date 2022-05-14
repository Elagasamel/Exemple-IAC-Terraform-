var cfg = { _id: 'replica01',
    members: [
        { _id: 0, host: 'node1.arivu.in:27017'},
        { _id: 1, host: 'node2.arivu.in:27017'}
    ]
};

var error = rs.initiate(cfg);
printjson(error);