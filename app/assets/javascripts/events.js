// $(document).on("ready page:load turbolinks:load", function() {
$( document ).ready(function() {
    // used by MDB time pickers
    $('.datepicker').pickadate({
        min: true,
        max: false
    });
    $('#event_start_time').pickatime({twelvehour: true});
    $('#event_end_time').pickatime({twelvehour: true});

    // used by Selectize.js for venue dropdown
    var selectizeCallback = null;

    $("#venueModal").on("hide.bs.modal", function(e) {
        if (selectizeCallback != null) {
            selectizeCallback();
            selecitzeCallback = null;
        }

        $("#new_venue").trigger("reset");
        // $.rails.enableFormElements($("#new_venue"));
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

                $("#venueModal").modal('hide');
            }
        });
    });

    // setup Selectize for states dropdown in modal window - also sets up Parsley validation
    $(function() {
        $('.selectize-states').selectize({
            valueField: 'id',
            labelField: 'name',
            searchField: 'name',
            onInitialize: function () {
                $("#venue_state-selectized").attr({
                    'data-parsley-errors-container': "#errors-state",
                    'data-parsley-class-handler': '.selectize-states .selectize-input',
                    'data-parsley-required-message': 'Please select or create a venue for the event.'
                });
            } //,
            // onChange: function(value) {
            //     $("#venue_state-selectized").parsley().validate();
            // }
        })
    });

    // setup Selectize for venues dropdown in modal window - also sets up Parsley validation
    $(".selectize").selectize({
        onInitialize: function(){
            $("#event_venue_id-selectized").attr({
                'data-parsley-errors-container': "#errors-venue",
                'data-parsley-class-handler': '.selectize-input',
                'data-parsley-required-message': 'Please select or create a venue for the event.'
            });
        },
        // onChange: function(value) {
        //     $("#event_venue_id-selectized").parsley().validate();
        // },
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
            $("#venueModal").modal({ keyboard: false });
            $("#venue_name").val(input);
        }
    });
    $('#new_event').parsley();
    $('#new_venue').parsley();

});
