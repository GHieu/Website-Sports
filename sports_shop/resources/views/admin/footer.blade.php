<!-- /.login-box -->

<!-- jQuery -->
<script src="/template/admin/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/template/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/template/admin/dist/js/adminlte.min.js"></script>
<!-- Bootstrap JS từ CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script src="/template/admin/js/main.js"></script>
<script>
    $(function () {
        $('#currency').maskMoney({
            suffix: 'đ',
            precision: 0
        });
    })
</script>
@yield('footer')