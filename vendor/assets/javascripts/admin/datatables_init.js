var NapthePendingOrder, UsersDatatable, XacNhanRutTienOrder;
jQuery(document).ready(function() {
  NapthePendingOrder = $('#orders-pending-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#orders-pending-datatable').data('source')
    },
    "pagingType": "full_numbers",
    "sDom": '<"top">rt<"bottom"ip><"clear">',
    "columns": [
      {"data": "number", orderable: true},
      {"data": "email", searchable: false, orderable: true},
      {"data": "nha_mang", searchable: true , orderable: false},
      {"data": "ma_the", searchable: false, orderable: false},
      {"data": "serial", searchable: false, orderable: false},
      {"data": "so_tien", searchable: false, orderable: true},
      {"data": "status"},
      {"data": "created_at", searchable: false, orderable: true},
      {"data": "btn_controls", searchable: false, orderable: true},
    ],
    fnServerParams: function(aoData) {
      console.log(aoData),
      aoData["search_nha_mang"] = $("#search_nha_mang").val()
    },

  });

  $('#search_nha_mang').on('change', function(){
    NapthePendingOrder.dataTable().fnDraw()
  })

  XacNhanRutTienOrder = $('#orders-pending-rut-tien').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#orders-pending-rut-tien').data('source')
    },
    "pagingType": "full_numbers",
    "sDom": '<"top">rt<"bottom"ip><"clear">',
    "columns": [
      {"data": "number", orderable: true},
      {"data": "email", searchable: false, orderable: true},
      {"data": "so_tien", searchable: false, orderable: true},
      {"data": "status"},
      {"data": "created_at", searchable: false, orderable: true},
      {"data": "btn_success", searchable: false, orderable: false},
      {"data": "btn_fail", searchable: false, orderable: false},
    ],
    fnServerParams: function(aoData) {
      // console.log(aoData),
      // aoData["search_nha_mang"] = $("#search_nha_mang").val()
    },

  });

  UsersDatatable = $('#users-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#users-datatable').data('source')
    },
    "pagingType": "full_numbers",
    "sDom": '<"top">rt<"bottom"ip><"clear">',
    "columns": [
      {"data": "id", orderable: true},
      {"data": "email", searchable: false, orderable: true},
      {"data": "xu", searchable: true , orderable: false},
      {"data": "ref_user", searchable: false, orderable: false},
      {"data": "created_at", searchable: false, orderable: true},
    ],
    fnServerParams: function(aoData) {
      console.log(aoData);
      // aoData["search_nha_mang"] = $("#search_nha_mang").val()
    },

  });
    
});