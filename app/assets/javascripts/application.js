// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require turbolinks
//= require ckeditor/init
//= require moment
//= require fullcalendar

//= require chartkick

$(function () {
    $('#container').highcharts({
        chart: {
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                viewDistance: 25,
                depth: 40
            }
        },

        title: {
            text: 'Email configuration of values'
        },

        xAxis: {
            categories: ['User', 'Sentmail', 'inbox', 'favorite', 'trash']
        },

        yAxis: {
            allowDecimals: false,
            min: 0,
            title: {
                text: 'Number of fruits'
            }
        },

        tooltip: {
            headerFormat: '<b>{point.key}</b><br>',
            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
        },

        plotOptions: {
            column: {
                stacking: 'normal',
                depth: 40
            }
        },

        series: [{
            name: 'ranarnaga',
            data: [5, 3, 4, 7, 2],
            stack: 'male'
        }, {
            name: 'ranglu',
            data: [3, 4, 4, 2, 5],
            stack: 'male'
        }, {
            name: 'sathiya',
            data: [2, 5, 6, 2, 1],
            stack: 'male'
        }, {
            name: 'bruelee',
            data: [3, 0, 4, 4, 3],
            stack: 'male'
        }]
    });
});

