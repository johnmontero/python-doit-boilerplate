import do_it
try: # for pip >= 10
    from pip._internal.req import parse_requirements
except ImportError: # for pip <= 9.0.3
    from pip.req import parse_requirements
from setuptools import setup, find_packages

long_description = "DoIt"
requirements = parse_requirements('requirements.txt', session=False)
install_requires = [str(r.req) for r in requirements]

setup(
    name             = 'do_it',
    description      = 'DoIt - Hazlo',
    packages         = find_packages(),
    package_data     = {
        'do_it': ['*.yaml']
    },
    author           = 'do-it',
    author_email     = 'do-it [at] gmail.com',
    scripts          = ['bin/do-it'],
    install_requires = install_requires,
    version          = do_it.__version__,
    url              = 'https://github.com/johnmontero/sga-iot-sub',
    license          = "MIT",
    zip_safe         = False,
    keywords         = "do, it, task",
    long_description = long_description,
    classifiers      = [
                        'Development Status :: 4 - Beta',
                        'Intended Audience :: Developers',
                        'License :: OSI Approved :: MIT License',
                        'Topic :: Software Development :: Build Tools',
                        'Topic :: Software Development :: Libraries',
                        'Topic :: Software Development :: Testing',
                        'Topic :: Utilities',
                        'Operating System :: MacOS :: MacOS X',
                        'Operating System :: Microsoft :: Windows',
                        'Operating System :: POSIX',
                        'Programming Language :: Python :: 3.6',
                        'Programming Language :: Python :: 2.7',
                      ]
)