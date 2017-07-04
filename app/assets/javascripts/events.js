$(function() {
    // used by MDB time pickers
    $('.datepicker').pickadate();
    $('#starttime').pickatime({twelvehour: true});
    $('#endtime').pickatime({twelvehour: true});

    // used by Selectize.js for venue dropdown
    var selectizeCallback = null;

    $(".venue-modal").on("hide.bs.modal", function(e) {
        if (selectizeCallback != null) {
            selectizeCallback();
            selecitzeCallback = null;
        }

        $("#new_venue").trigger("reset");
        $.rails.enableFormElements($("#new_venue"));
    });

    $("#new_venue").on("submit", function(e) {
        e.preventDefault();
        $.ajax({
            method: "POST",
            url: $(this).attr("action"),
            data: $(this).serialize(),
            success: function(response) {
                selectizeCallback(response);
                selectizeCallback = null;

                $(".venue-modal").modal('toggle');
            }
        });
    });

    $(".selectize").selectize({
        valueField: 'id',
        labelField: 'name',
        searchField: ['name', 'address'],
        highlight: false,
        load: function(query, callback) {
            if (!query.length || query.length < 2) return callback();
            $.ajax({
                url: '/venues/search?r='+query,
                type: 'GET',
                dataType: 'json',
                success: function(res) {
                    callback(res);
                }
            });
        },
        render: {
            item: function(item, escape) {
                return '<div>' +
                    (item.name ? '<span class="name">' + escape(item.name) + '</span>' : '') +
                    (item.full_address ? ': <span class="address">' +
                        escape(item.full_address) +
                        '</span>' : '') +
                    '</div>';
            },
            option: function(item, escape) {
                var label = item.name || item.full_address;
                var caption = item.name ? (item.full_address) : null;
                return '<div>' +
                    '<span class="label">' + escape(label) + '</span>' +
                    (caption ? '<span class="caption">' + escape(caption) + '</span>' : '') +
                    '</div>';
            }
        },
        create: function(input, callback) {
            selectizeCallback = callback;
            $(".venue-modal").modal();
            $("#venue_name").val(input);
        }
    });
});
