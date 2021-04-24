from .context import stellaris_technology_optimizer


def test_app(capsys, example_fixture):
    # pylint: disable=W0612,W0613
    stellaris_technology_optimizer.Blueprint.run()
    captured = capsys.readouterr()

    assert "Hello World..." in captured.out
