import click

from do_it.doit import pass_context
from do_it import __version__

@click.command()
@pass_context
def command(ctx, **kwargs):
    """Show version and exit."""
    print(f"Version: {__version__}")
    print("")
    print("config.yaml:")
    print("-----------")
    print("logger:")
    print(" - verbose: {}".format(
             ctx.config['logger']['verbose']))
