<form id="form_clientes" autocomplete="off">

    <div class="form_crud_modal">
        <input type="hidden" name="ID" id="ID" />
        <div class="row">
            <div class="col-xl-3">
                <label for="NOME">Nome</label>
                <input type="text" class="form-control form-control-sm" placeholder="Nome" name="NOME" minlength="3" maxlength="100" required />
            </div>
            <div class="col-xl-2">
                <label for="CODIGO_DB">Codigo DB</label>
                <input type="text" minlength="3" title="caixa baixa, minimo de 3 caracteres" maxlength="20" pattern="[a-z]{3,20}" class="form-control form-control-sm text-center" placeholder="Nome do banco de dados" name="CODIGO_DB" required />
            </div>
            <div class="col-xl-2">
                <label for="CODIGO_CLI">Codigo cliente</label>
                <input type="number" minlength="4"  maxlength="20" min="1000" max="9999" class="form-control form-control-sm text-center" placeholder="Codigo do cliente" name="CODIGO_CLIENTE" required />
            </div>			
            <div class="col-xl-1">
                <label for="STATUS">Status</label>
                <?php echo $status; ?>
            </div>
            <div class="col-xl-1">
                <label for="DIA_VENCE">Dia Vence</label>
                <?php echo $dia_vence; ?>
            </div>
            <div class="col-xl-1">
                <label for="DIAS_PRAZO">Prazo</label>
                <?php echo $dias_prazo; ?>
            </div>
            <div class="col-xl-2">
                <label for="EMAIL">Email</label>
                <input type="email" name="EMAIL" minlength="3" required maxlength="100" class="form-control form-control-sm" />
            </div>
            <div class="col-xl-2">
                <label for="CELULAR">Celuar</label>
                <input type="text" name="CELULAR" required minlength="15" maxlength="15" class="form-control form-control-sm text-center" />
            </div>
            <div class="col-lg-4 col-xs-12 col-md-12">
                <label for="imagem">Foto/Logo</label>
                <!--	<input type="file" accept="image/*" id="DOC" class="form-control form-control-sm" name="DOC"> -->
                <div class="custom-file">
                    <input type="file" id="DOC" accept=".png, .jpg, .JPEG, .ico, .pdf" class="custom-file-input form-control-sm" name="DOC" />
                    <label class="custom-file-label" for="customFile"></label>
                </div>
            </div>
        </div>
        <?php echo ns_BtnFormulario(); ?>

    </div>
    <?php echo ns_BtNovo(); ?>
    <table class="table table-bordered dataTable table-sm" id="tableBasicas">
        <thead>
            <tr>
                <th>Nome</th>
                <th>Codigo DB</th>
				<th>Codigo cliente</th>
                <th>Dia vence</th>
                <th>prazo</th>
                <th>Criado em</th>
                <th>Status</th>
                <th>Logo</th>
                <th class="text-center">A&ccedil;&atilde;o</th>
            </tr>
        </thead>
    </table>
</form>