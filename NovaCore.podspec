Pod::Spec.new do |spec|
    spec.name           = 'NovaCore'
    spec.version        = '0.0.1'
    spec.license        = { :type => 'MIT' }
    spec.homepage       = 'https://github.com/netizen01/NovaCore'
    spec.authors        = { 'Netizen01' => 'n01@invco.de' }
    spec.summary        = 'Common Extensions and Utilities for Nova Packages'
    spec.source         = { :git => 'https://github.com/netizen01/NovaCore.git',
                            :tag => spec.version.to_s }
    spec.source_files   = 'Source/**/*.swift'

    spec.ios.deployment_target  = '8.4'
end
